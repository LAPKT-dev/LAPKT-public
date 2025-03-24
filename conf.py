"""!
@file conf.py
@brief doxysphinx autodoc configuration
@details https://github.com/boschglobal/doxysphinx/blob/9fd7c7104545959ca45c74752108dd1efe0b02e4/conf.py
@author Anubhav Singh (anubhav.singh.er@pm.me)
@version 1.0
@date 2023-01-04

@copyright Copyright (c) 2023
"""

#---- BEGIN doxysphinx Config ----#

from os import environ

theme_options = {
    "sphinx_rtd_theme" : {
        "show_nav_level": 1,
        "collapse_navigation": True,
        "github_url": "https://github.com/boschglobal/doxysphinx",
        "repository_url": "https://github.com/boschglobal/doxysphinx",
        "logo_only": False,
    },
    "sphinx_book_theme": {
            "show_navbar_depth": 1,
            "collapse_navigation": True,
            "repository_url": "https://github.com/boschglobal/doxysphinx",
            "use_repository_button": True,
            "use_edit_page_button": True,
            "repository_branch": "main",
            "logo_only": True,
            "home_page_in_toc": True,
            "extra_navbar": '<div class="attribution">theme based on the '
            '<a href="https://sphinx-book-theme.readthedocs.io/">sphinx book theme</a> '
            'by the <a href="https://executablebooks.org/">executable book project'
            "</a>.</div>",
        }
}

# The 'extensions` list should already be in here from `sphinx-quickstart`
extensions = [
    # there may be others here already, e.g. 'sphinx.ext.mathjax'
    "sphinxcontrib.needs",
    "sphinxcontrib.plantuml",
    "sphinx.ext.mathjax",
    "sphinx.ext.ifconfig",
    "sphinx.ext.autodoc",
    # "autoapi.extension",
    "sphinx.ext.viewcode",
    "myst_parser",
    "matplotlib.sphinxext.plot_directive",
    "sphinx.ext.duration",
    "sphinx.ext.napoleon",
    "sphinx.ext.graphviz",
    "sphinx.ext.todo",
    "sphinx_copybutton",
    "sphinxcontrib.doxylink",
    "sphinx.ext.inheritance_diagram",
    "sphinx_design",
 ]

# Setup the breathe extension

project = "LAPKT"
master_doc = "index"
html_theme = "sphinx_rtd_theme"
# html_theme = "sphinx_book_theme"

html_theme_options = theme_options[html_theme]
html_title = project
html_logo = "cmake/docs/resources/logo/logo-no-background.svg"

# Tell sphinx what the primary language being documented is.
primary_domain = 'cpp'

# Tell sphinx what the pygments highlight language should be.
highlight_language = 'cpp'

exclude_patterns = [
]

# autoapi_dirs = ["src"]
# autoapi_root = "docs/auto_api"
# autoapi_options = ["members", "undoc-members", "show-inheritance", "show-inheritance-diagram", "show-module-summary"]
# autoapi_keep_files = True
# autoapi_add_toctree_entry = False
# autodoc_typehints = "signature"

doxylink = {
    "lapkt": (
        environ["DOXYGEN_OUTPUT_DIRECTORY"] + "/tagfile.xml",
        environ["DOXYGEN_OUTPUT_DIRECTORY"]
    ),
}

#---- END doxysphinx config ----#