#---- BEGIN Auto doc configuration ----#
#### Generate Auto documentation
option(AUTODOC "Generate automatic source documentation" ON)

if(AUTODOC)
  set(AUTODOC_DIR ${PROJECT_BINARY_DIR}/docs)
  file(MAKE_DIRECTORY ${AUTODOC_DIR})
    #---- Generate Doxygen docs ----#
    find_package(Doxygen REQUIRED)
    message("Doxygen found - Generating auto docs")
    set(DOXYGEN_OUTPUT_DIRECTORY ${AUTODOC_DIR})
    set(DOXYGEN_RECURSIVE YES)
    set(DOXYGEN_PROJECT_NAME "LAPKT Source Documentation")
    set(DOXYGEN_GENERATE_LATEX YES)
    set(DOXYGEN_PDF_HYPERLINKS YES)
    set(DOXYGEN_USE_PDFLATEX YES)
    set(DOXYGEN_GENERATE_HTML YES)
    set(DOXYGEN_GENERATE_MAN NO)
    set(DOXYGEN_GENERATE_XML NO)
    set(DOXYGEN_HAVE_DOT YES)
    set(DOXYGEN_GRAPHICAL_HIERARCHY YES)
    set(DOXYGEN_SEARCHENGINE YES)
    # set(DOXYGEN_SERVER_BASED_SEARCH YES)
    # set(DOXYGEN_EXTERNAL_SEARCH NO)
    # set(DOXYGEN_ALPHABETICAL_INDEX NO)
    # set(DOXYGEN_DOT_IMAGE_FORMAT svg)
    set(DOXYGEN_DOT_TRANSPARENT YES)
    set(DOXYGEN_SHOW_NAMESPACES NO)
    set(DOXYGEN_PROJECT_LOGO  ${CMAKE_CURRENT_SOURCE_DIR}/img/white_logo.png)
    set(DOXYGEN_EXCLUDE ${PROJECT_SOURCE_DIR}/external
            ${PROJECT_SOURCE_DIR}../developersguide/debug_snippet.py)

    #---- BEGIN Flat Design ----#
    # set(DOXYGEN_HTML_EXTRA_STYLESHEET ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_flat_design/doxygen-style.css)
    # set(DOXYGEN_HTML_EXTRA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_flat_design/img)
    #---- End Flat Design ----#
    #---- BEGIN Awesome Design ----#
    set(DOXYGEN_GENERATE_TREEVIEW YES)
    set(DOXYGEN_HTML_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/header.html)
    set(DOXYGEN_HTML_FOOTER ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/footer.html)
    set(DOXYGEN_HTML_EXTRA_STYLESHEET ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/doxygen-awesome.css  
            ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/doxygen-awesome-sidebar-only.css
            ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/doxygen-awesome-sidebar-only-darkmode-toggle.css)
    set(DOXYGEN_HTML_EXTRA_FILES ${CMAKE_CURRENT_SOURCE_DIR}/doxygen_awesome_design/doxygen-awesome-darkmode-toggle.js)
    #---- END Awesome Design ----#

    doxygen_add_docs(doxygen
    ${PROJECT_SOURCE_DIR}/../developersguide  ${PROJECT_SOURCE_DIR}
    ALL
    COMMENT "Generate HTML documentation"
    )

 

    #---- BEGIN Sphinx translation ----#
    # set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/config/cmake)
    # find_package(Sphinx REQUIRED)
    # set(SPHINX_SOURCE ${PROJECT_BINARY_DIR}/docs/sphinx)
    # set(SPHINX_BUILD ${PROJECT_BINARY_DIR}/docs/sphinx/html)
    # #---- Copy configuration to the docs dir ----#
    # configure_file(${CMAKE_CURRENT_SOURCE_DIR}/conf.py ${SPHINX_SOURCE} COPYONLY)
    # configure_file(${CMAKE_CURRENT_SOURCE_DIR}/index.rst ${SPHINX_SOURCE} COPYONLY)
    # #---- End Breathe config ----#
    # add_custom_target(Sphinx ALL
    #     COMMAND ${SPHINX_EXEC} -b html
    #     #-Dbreathe_projects.LAPKT=${SPHINX_SOURCE}/xml
    #     ${SPHINX_SOURCE} ${SPHINX_BUILD}
    #     WORKING_DIRECTORY ${SPHINX_SOURCE}
    #     COMMENT "Generating documentation with Sphinx")
#---- END Sphinx translation ----#
  # Include the docs in the package
  install(DIRECTORY
    ${AUTODOC_DIR}
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
  install(DIRECTORY
    ${AUTODOC_DIR}
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL    
  )

endif(AUTODOC)
#---- END Doxygen configuration ----#

