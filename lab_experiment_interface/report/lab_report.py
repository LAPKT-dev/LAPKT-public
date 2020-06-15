#!/usr/bin/python3

################################################################################
#                                                                              #
# Lab :-    Python package for running code on a large set of benchmarks       #
#                                                                              #
# Info:     Generated Reports                                                  #
#                                                                              #
# Author:   Anubhav Singh                                                      #
#                                                                              # 
# Date:     3-Sep-2019                                                         #
#                                                                              #
################################################################################
from collections import defaultdict
import itertools
import logging
import math
import os
from textwrap import fill
import re

try:
    # Python 2
    from itertools import izip
except ImportError:
    # Python 3+
    izip = zip

try:
    import matplotlib
    from matplotlib import figure
    from matplotlib.backends import backend_agg
    import matplotlib.lines as mlines
except ImportError as err:
    logging.warning('matplotlib not found: {}'.format(err))

from lab import tools

from downward.reports import PlanningReport
from downward.reports.scatter import ScatterPgfplots
############ DEFINE UTILITY METHODS ############


############ DEFINE REPORT SUB-CLASSES ############
#################### CACTUS PLOT ##################
class CactusPlotReport(PlanningReport) :
    """
    TODO
    """
    def __init__(
            self, show_missing=True, get_category=None, title=None,
            xscale=None, yscale=None, xlabel='', ylabel='',
            search_param=None,
            matplotlib_options=None, time_limit=1800, **kwargs):
        kwargs.setdefault('format', 'png')
        PlanningReport.__init__(self, **kwargs)
        self.time_limit = time_limit
        self.search_param = search_param
        if len(self.attributes) != 1:
            logging.critical('CactusPlotReport needs exactly one attribute')
        self.attribute = self.attributes[0]
        # By default all values are in the same category "None".
        self.show_missing = show_missing
        if self.output_format == 'tex':
            self.writer = ScatterPgfplots #TODO
        else:
            self.writer = CactusMatplotlib #TODO
        self.title = title if title is not None else ("Instances solved over time" or '')
        self._set_scales(xscale, yscale)
        self.xlabel = fill(xlabel,25)
        self.ylabel = fill(ylabel,25)
        # If the size has not been set explicitly, make it a square.
        self.matplotlib_options = matplotlib_options or {'figure.figsize': [8, 8]}
        if 'legend.loc' in self.matplotlib_options:
            logging.warning('The "legend.loc" parameter is ignored.')

    def _set_scales(self, xscale, yscale):
        self.xscale = xscale or 'log'
        self.yscale = yscale or 'log'
        scales = ['linear', 'log', 'symlog']
        for scale in [self.xscale, self.yscale]:
            if scale not in scales:
                logging.critical("Scale {} not in {}".format(scale, scales))

    def has_multiple_categories(self):
        return any(key is not None for key in self.categories.keys())

    def _fill_categories(self):
        """Map category names to coordinate lists."""
        categories = defaultdict(list)
        numover_x = {}
        counter      = {}
        plot_algos   = {} # False means part of plot
        assert self.algorithms, "ERROR - algorithms not known"
        for algo in self.algorithms :
            plot_algos[algo] = False
            if self.search_param:
                plot_algos[algo] = True
                for param in self.search_param:
                    if re.search(param, algo):
                        plot_algos[algo] = False
                        break

        for algo in self.algorithms :
            if plot_algos[algo] :
                continue
            numover_x[fill(algo, 20)] = {}
            counter[fill(algo, 20)] = {}
            if self.attribute=='runtime' :
                for i in range ( self.time_limit * 10 ) :
                    numover_x[fill(algo, 20)][round(float(i)*0.1, 1)] = 0
            elif self.attribute=='memory':
                for i in range ( 9000 ) :
                    numover_x[fill(algo, 20)][round(float(i), 0)] = 0
            else :
                for i in range ( 150000 ) :
                    numover_x[fill(algo, 20)][round(float(i), 0)] = 0

        for i, runs in enumerate(self.problem_runs.values()):
            for run in runs :
                if plot_algos[run['algorithm']] :
                    continue
                if run['coverage'] and run[self.attribute]==None :
                    run[self.attribute] = 0
                if self.attribute=='runtime' and run['coverage'] :
                    t = round(float(run['runtime']), 1)
                    numover_x[fill(run['algorithm'], 20)][t] += 1
                elif run['coverage'] and self.attribute=='memory' :
                    t = round(float(run['memory']), 0)
                    numover_x[fill(run['algorithm'], 20)][t] += 1
                elif run['coverage'] :
                    t = round(float(run[self.attribute])/1000, 0)
                    numover_x[fill(run['algorithm'], 20)][t] += 1

        for k in numover_x.keys() :
            if self.attribute=='runtime' :
                for t in [ round(x*0.1,1) for x in range(self.time_limit*10-1)] :
                    numover_x[k][round(t+0.1,1)] += numover_x[k][t]
            elif self.attribute=='memory' :
                for t in range(9000-1) :
                    numover_x[k][t+1] += numover_x[k][t]
            else :  
                for t in range(150000-1) :
                    numover_x[k][t+1] += numover_x[k][t]

        for category, cum_x in  numover_x.items() :
            for x, t in cum_x.items() :
                if t :
                    if self.attribute=='runtime':
                        categories[category].append( (x+0.1, t))
                    else :
                        categories[category].append( (x+1, t))
        return categories

    def _compute_missing_value(self, categories):
        if not self.show_missing:
            return None
        if not any(None in coord for coords in categories.values() for coord in coords):
            return None
        max_value = max(max(coord) for coords in categories.values() for coord in coords)
        if max_value is None:
            return 1
        if self.xscale == 'linear':
            return max_value * 1.1
        return int(10 ** math.ceil(math.log10(max_value)))

    def _handle_non_positive_values(self, categories):
        """Plot integer 0 values at 0.1 in log plots and abort if any value is < 0."""
        assert self.xscale == self.yscale == 'log'
        new_categories = {}
        for category, coords in categories.items():
            new_coords = []
            for x, y in coords:
                if x == 0 and isinstance(x, int):
                    x = 0.1
                if y == 0 and isinstance(y, int):
                    y = 0.1

                if (x is not None and x <= 0) or (y is not None and y <= 0):
                    logging.critical(
                        'Logarithmic axes can only show positive values. '
                        'Use a symlog or linear scale instead.')
                else:
                    new_coords.append((x, y))
            new_categories[category] = new_coords
        return new_categories

    def _handle_missing_values(self, categories):
        new_categories = {}
        for category, coords in categories.items():
            if self.show_missing:
                coords = [
                    (x if x is not None else self.missing_value,
                     y if y is not None else self.missing_value) for x, y in coords]
            else:
                coords = [coord for coord in coords if None not in coord]
            if coords:
                new_categories[category] = coords
        return new_categories

    def _get_category_styles(self, categories):
        """
        Create dictionary mapping from category name to marker style.
        """
        shapes = 'x+1234'
        #colors = ['C{}'.format(c) for c in range(18)]
        colors = [ 'b', 'r', 'g',  '#808080', 'orange', 'y', 'k',  
                   'm', 'c', 'darkgoldenrod','firebrick','pink','purple','brown',
                   'maroon','gold','darkgreen']

        num_styles = len(shapes) * len(colors)
        styles = [
            {'marker': shape, 'c': color}
            for shape, color in itertools.islice(izip(
                itertools.cycle(shapes), itertools.cycle(colors)), num_styles)]
        #assert len({(s['marker'], s['c']) for s in styles}) == num_styles, (
        #    "The number of shapes and the number of colors must be coprime.")

        category_styles = {}
        for i, category in enumerate(sorted(categories)):
            category_styles[category] = styles[i % len(styles)]
        return category_styles

    def _write_plot(self, runs, filename):
        # Map category names to coord tuples.
        categories = self._fill_categories()
        self.missing_value = self._compute_missing_value(categories)
        #if self.xscale == 'log':
            #categories = self._handle_non_positive_values(categories)
        self.categories = self._handle_missing_values(categories)
        #if not self.categories:
        #    logging.critical("Plot contains no points.")
        self.styles = self._get_category_styles(self.categories)
        self.writer.write(self, filename)

    def write(self):
        if len(self.algorithms) < 1:
            logging.critical(
                'Cactus plots need >=1 algorithms: %s' % self.algorithms)
        self.xlabel = self.xlabel or "Time (s)"
        self.ylabel = self.ylabel or "Number/ Count"

        suffix = '.' + self.output_format
        if not self.outfile.endswith(suffix):
            self.outfile += suffix
        tools.makedirs(os.path.dirname(self.outfile))
        self._write_plot(self.runs.values(), self.outfile)

#################### CACTUS PLOT LIB ###############
class CactusMatplotlib(object):
    XAXIS_LABEL_PADDING = 5
    YAXIS_LABEL_PADDING = 5
    TITLE_PADDING = 10

    @classmethod
    def _plot(cls, report, axes):
        axes.grid(b=True, linestyle='-', color='0.75')

        for category, coords in sorted(report.categories.items()):
            x_vals, y_vals = zip(*coords)
            axes.scatter(
                x_vals, y_vals, clip_on=False, label=category, **report.styles[category])

        if report.missing_value is not None:
            axes.set_xbound(upper=report.missing_value)
            axes.set_ybound(upper=report.missing_value)
        xmin, xmax = axes.get_xbound()
        ymin, ymax = axes.get_ybound()
        axes.set_xlim(xmin=0, xmax=xmax)
        axes.set_ylim(ymin=0, ymax=ymax+(ymax/10+1))

    @classmethod
    def write(cls, report, filename):
        MatplotlibPlot.set_rc_params(report.matplotlib_options)
        plot = MatplotlibPlot()
        if report.title:
            plot.axes.set_title(report.title, pad=cls.TITLE_PADDING)
        if report.xlabel:
            plot.axes.set_xlabel(report.xlabel, labelpad=cls.XAXIS_LABEL_PADDING)
        if report.ylabel:
            plot.axes.set_ylabel(report.ylabel, labelpad=cls.YAXIS_LABEL_PADDING)

        if report.xscale != 'linear' :
            plot.axes.set_xscale(report.xscale, basex=10)
        else :
            plot.axes.set_xscale(report.xscale)
        if report.yscale != 'linear' :
            plot.axes.set_yscale(report.yscale, basey=10)
        else :
            plot.axes.set_yscale(report.yscale)
        cls._plot(report, plot.axes)

        if report.has_multiple_categories():
            plot.create_legend()
        plot.print_figure(filename)

#################### MATPLOTLIB PLOT ##################
class MatplotlibPlot(object):
    def __init__(self):
        self.legend = None
        self.create_canvas_and_axes()

    def create_canvas_and_axes(self):
        fig = figure.Figure()
        self.canvas = backend_agg.FigureCanvasAgg(fig)
        self.axes = fig.add_subplot(111)

    @staticmethod
    def set_rc_params(matplotlib_options):
        # Reset options from rc file.
        matplotlib.rc_file_defaults()
        if matplotlib_options:
            matplotlib.rcParams.update(matplotlib_options)

    def create_legend(self):
        self.legend = self.axes.legend(
            scatterpoints=1, loc='upper center', bbox_to_anchor=(0.5, -0.15),
          fancybox=True, shadow=True, ncol=5)

    def print_figure(self, filename):
        # Save the generated scatter plot to a file.
        # Legend is still bugged in matplotlib, but there is a patch see:
        # http://www.mail-archive.com/matplotlib-users@lists.sourceforge.net/msg20445.html
        extra_artists = []
        if self.legend:
            extra_artists.append(self.legend.legendPatch)
        kwargs = {'bbox_extra_artists': extra_artists}
        # Note: Setting bbox_inches keyword breaks pgf export.
        if not filename.endswith('pgf'):
            kwargs['bbox_inches'] = 'tight'
        self.canvas.print_figure(filename, **kwargs)
        logging.info('Wrote file://{}'.format(filename))

class ScatterPlotReport(PlanningReport):
    """
    Generate a scatter plot for an attribute.
    """
    def __init__(
            self, show_missing=True, get_category=None, title=None,
            xscale=None, yscale=None, xlabel='', ylabel='',
            matplotlib_options=None, **kwargs):
        """

        """
        kwargs.setdefault('format', 'png')
        PlanningReport.__init__(self, **kwargs)
        if len(self.attributes) != 1:
            logging.critical('ScatterPlotReport needs exactly one attribute')
        self.attribute = self.attributes[0]
        # By default all values are in the same category "None".
        self.get_category = get_category or (lambda run1, run2: None)
        self.show_missing = show_missing
        if self.output_format == 'tex':
            self.writer = ScatterPgfplots
        else:
            self.writer = MyMatplotlib
        self.title = title if title is not None else (self.attribute or '')
        self._set_scales(xscale, yscale)
        self.xlabel = xlabel
        self.ylabel = ylabel
        # If the size has not been set explicitly, make it a square.
        self.matplotlib_options = matplotlib_options or {'figure.figsize': [8, 8]}
        if 'legend.loc' in self.matplotlib_options:
            logging.warning('The "legend.loc" parameter is ignored.')

    def _set_scales(self, xscale, yscale):
        self.xscale = xscale or self.attribute.scale or 'log'
        self.yscale = yscale or self.attribute.scale or 'log'
        scales = ['linear', 'log', 'symlog']
        for scale in [self.xscale, self.yscale]:
            if scale not in scales:
                logging.critical("Scale {} not in {}".format(scale, scales))
        if self.xscale != self.yscale:
            logging.critical('Scatter plots must use the same scale on both axes.')

    def has_multiple_categories(self):
        return any(key is not None for key in self.categories.keys())

    def _fill_categories(self):
        """Map category names to coordinate lists."""
        categories = defaultdict(list)
        for runs in self.problem_runs.values():
            try:
                run1, run2 = runs
            except ValueError:
                logging.critical(
                    'Scatter plot needs exactly two runs for {domain}:{problem}. '
                    'Instead of filtering a whole run, try setting only some of its '
                    'attribute values to None in a filter.'.format(**runs[0]))
            category = self.get_category(run1, run2)
            categories[category].append(
                (run1.get(self.attribute), run2.get(self.attribute)))
        return categories

    def _compute_missing_value(self, categories):
        if not self.show_missing:
            return None
        if not any(None in coord for coords in categories.values() for coord in coords):
            return None
        max_value = max(max(coord) for coords in categories.values() for coord in coords)
        if max_value is None:
            return 1
        if self.xscale == 'linear':
            return max_value * 1.1
        return int(10 ** math.ceil(math.log10(max_value)))

    def _handle_non_positive_values(self, categories):
        """Plot integer 0 values at 0.1 in log plots and abort if any value is < 0."""
        assert self.xscale == self.yscale == 'log'
        new_categories = {}
        for category, coords in categories.items():
            new_coords = []
            for x, y in coords:
                if x == 0 and isinstance(x, int):
                    x = 0.1
                if y == 0 and isinstance(y, int):
                    y = 0.1

                if (x is not None and x <= 0) or (y is not None and y <= 0):
                    logging.critical(
                        'Logarithmic axes can only show positive values. '
                        'Use a symlog or linear scale instead.')
                else:
                    new_coords.append((x, y))
            new_categories[category] = new_coords
        return new_categories

    def _handle_missing_values(self, categories):
        new_categories = {}
        for category, coords in categories.items():
            if self.show_missing:
                coords = [
                    (x if x is not None else self.missing_value,
                     y if y is not None else self.missing_value) for x, y in coords]
            else:
                coords = [coord for coord in coords if None not in coord]
            if coords:
                new_categories[category] = coords
        return new_categories

    def _get_category_styles(self, categories):
        """
        Create dictionary mapping from category name to marker style.
        """
        shapes = 'ox+s^v<>D'
        #colors = ['C{}'.format(c) for c in range(10)]
        colors = [ 'firebrick', 'b', 'r', 'g',  '#808080', 'orange', 'y', 'k',
                   'm',  'darkgoldenrod']


        num_styles = len(shapes) * len(colors)
        styles = [
            {'marker': shape, 'c': color}
            for shape, color in itertools.islice(izip(
                itertools.cycle(shapes), itertools.cycle(colors)), num_styles)]
        assert len({(s['marker'], s['c']) for s in styles}) == num_styles, (
            "The number of shapes and the number of colors must be coprime.")

        category_styles = {}
        for i, category in enumerate(sorted(categories)):
            category_styles[category] = styles[i % len(styles)]
        return category_styles

    def _write_plot(self, runs, filename):
        # Map category names to coord tuples.
        categories = self._fill_categories()
        self.missing_value = self._compute_missing_value(categories)
        if self.xscale == 'log':
            categories = self._handle_non_positive_values(categories)
        self.categories = self._handle_missing_values(categories)
        #if not self.categories:
        #    logging.critical("Plot contains no points.")
        self.styles = self._get_category_styles(self.categories)
        self.writer.write(self, filename)

    def write(self):
        if not len(self.algorithms) == 2:
            logging.critical(
                'Scatter plots need exactly 2 algorithms: %s' % self.algorithms)
        self.xlabel = self.xlabel or self.algorithms[0]
        self.ylabel = self.ylabel or self.algorithms[1]

        suffix = '.' + self.output_format
        if not self.outfile.endswith(suffix):
            self.outfile += suffix
        tools.makedirs(os.path.dirname(self.outfile))
        self._write_plot(self.runs.values(), self.outfile)

class MyMatplotlib(object):
    XAXIS_LABEL_PADDING = 5
    YAXIS_LABEL_PADDING = 5
    TITLE_PADDING = 10

    @classmethod
    def _plot(cls, report, axes):
        axes.grid(b=True, linestyle='-', color='0.75')
        for category, coords in sorted(report.categories.items()):
            x_vals, y_vals = zip(*coords)
            axes.scatter(
                x_vals, y_vals, clip_on=False, label=category, **report.styles[category])

        if report.missing_value is not None:
            axes.set_xbound(upper=report.missing_value)
            axes.set_ybound(upper=report.missing_value)

        # Plot a diagonal black line.
        xmin, xmax = axes.get_xbound()
        ymin, ymax = axes.get_ybound()
        xmin = min(xmin,ymin)
        ymin = xmin
        xmax = max(xmax,ymax)
        ymax = xmax
        axes.set_xlim(xmin=xmin, xmax=xmax)
        axes.set_ylim(ymin=ymin, ymax=ymax)
        axes.add_line(mlines.Line2D([xmin, xmax], [ymin, ymax], color='k', alpha=0.5))

    @classmethod
    def write(cls, report, filename):
        MatplotlibPlot.set_rc_params(report.matplotlib_options)
        plot = MatplotlibPlot()
        if report.title:
            plot.axes.set_title(report.title, pad=cls.TITLE_PADDING)
        if report.xlabel:
            plot.axes.set_xlabel(report.xlabel, labelpad=cls.XAXIS_LABEL_PADDING)
        if report.ylabel:
            plot.axes.set_ylabel(report.ylabel, labelpad=cls.YAXIS_LABEL_PADDING)

        plot.axes.set_xscale(report.xscale)
        plot.axes.set_yscale(report.yscale)
        cls._plot(report, plot.axes)

        if report.has_multiple_categories():
            plot.create_legend()
        plot.print_figure(filename)
