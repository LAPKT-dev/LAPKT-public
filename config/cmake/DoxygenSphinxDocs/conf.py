# This file is used to add Sphinx-Breathe configurations
# Refer https://breathe.readthedocs.io/en/latest/index.html


#---- BEGIN config for a direct copy of doxygen generated html ----#

# from pathlib import Path

# extensions              = ['sphinx.ext.todo']# , 'breathe' ]
# #breathe_projects        = { "lapkt": Path("./xml") }
# #breathe_default_project = "lapkt"
# html_theme              = "sphinx_rtd_theme"
# html_extra_path = ['./html']

#---- END config ----#


#---- BEGIN Exhale Config ----#

from os import environ

# The `extensions` list should already be in here from `sphinx-quickstart`
extensions = [
    # there may be others here already, e.g. 'sphinx.ext.mathjax'
    'breathe',
    'exhale',
    'sphinx.ext.todo'
]

# Setup the breathe extension
breathe_projects = {
    "lapkt": environ["DOXYGEN_OUTPUT_DIRECTORY"]
}

breathe_default_project = "lapkt"
html_theme              = "sphinx_rtd_theme"
# Setup the exhale extension
exhale_args = {
    # These arguments are required
    "containmentFolder":     "./api",
    "rootFileName":          "library_root.rst",
    "doxygenStripFromPath":  "..",
    # Heavily encouraged optional argument (see docs)
    #"rootFileTitle":         "Library API",
    # Suggested optional arguments
    "createTreeView":        True,
    # TIP: if using the sphinx-bootstrap-theme, you need
    # "treeViewIsBootstrap": True,
    # "exhaleExecutesDoxygen": True,
    # "exhaleDoxygenStdin":   "INPUT = ../../src\n",
}

# Tell sphinx what the primary language being documented is.
primary_domain = 'cpp'

# Tell sphinx what the pygments highlight language should be.
highlight_language = 'cpp'

#---- END Exhale config ----#