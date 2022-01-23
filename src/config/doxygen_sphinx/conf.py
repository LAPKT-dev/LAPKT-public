# This file is used to add Sphinx-Breathe configurations
# Refer https://breathe.readthedocs.io/en/latest/index.html

from pathlib import Path

extensions              = ['sphinx.ext.todo']# , 'breathe' ]
#breathe_projects        = { "LAPKT": Path("./xml") }
#breathe_default_project = "LAPKT"
html_theme              = "sphinx_rtd_theme"
html_extra_path = ['./html']