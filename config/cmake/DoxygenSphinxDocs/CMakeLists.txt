#---- BEGIN Auto doc configuration ----#
#### Generate Auto documentation


set(LINUX_BUILD OFF)
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux" OR CYGWIN)
  set(LINUX_BUILD ON)
endif()

if(CMAKE_SPHINX_DOCS OR CMAKE_DOXYGEN_DOCS)
  if(LINUX_BUILD)
    find_package(Doxygen)
    if(Doxygen_FOUND)
      message(${Doxygen} "will be used to generate C++ documentation")
      set(AUTODOC_DIR ${PROJECT_BINARY_DIR}/docs)
      file(MAKE_DIRECTORY ${AUTODOC_DIR})
      file(MAKE_DIRECTORY ${AUTODOC_DIR}/doxygen)
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
    else()
      message(WARNING "Source code documentation cannot be generated since Doxygen wasn't found")
    endif(Doxygen_FOUND)
  else()
    message(WARNING "Source code autodocumentation will not be generated since Doxygen is not configured for Non-Linux systems")
  endif(LINUX_BUILD)
endif(CMAKE_SPHINX_DOCS OR CMAKE_DOXYGEN_DOCS)


if(CMAKE_DOXYGEN_DOCS AND Doxygen_FOUND AND LINUX_BUILD)
  if (CMAKE_DOXYGEN_AWESOME_THEME)
    add_custom_target(Doxygen_Awesome ALL
      COMMAND 
      HTML_OUTPUT=html_awesome_theme
      DOXYGEN_OUTPUT_DIRECTORY=${AUTODOC_DIR}/doxygen
      DOXYGEN_LAPKT_SOURCE_DIR=${PROJECT_SOURCE_DIR}/src
      DOXYGEN_LAPKT_DEV_GUIDE_DIR=${PROJECT_SOURCE_DIR}/developersguide
      DOXYGEN_EXCLUDE=${PROJECT_SOURCE_DIR}/developersguide/debug_snippet.py
      DOXYGEN_THEME_CSS=doxygen_awesome_design/doxygen-awesome.css
      DOXYGEN_AWESOME_CSS_SIDEBAR=doxygen_awesome_design/doxygen-awesome-sidebar-only.css
      DOXYGEN_AWESOME_CSS_TOGGLE=doxygen_awesome_design/doxygen-awesome-sidebar-only-darkmode-toggle.css
      DOXYGEN_EXTRA_FILES=doxygen_awesome_design/doxygen-awesome-darkmode-toggle.js
      DOXYGEN_HTML_HEADER=doxygen_awesome_design/header.html
      DOXYGEN_HTML_FOOTER=doxygen_awesome_design/footer.html
      DOXYGEN_GENERATE_LATEX=NO
      DOXYGEN_GENERATE_XML=NO
      DOXYGEN_LAPKT_LOGO=img/logo_small.png
      DOXYGEN_QUIET=YES
      ${DOXYGEN_EXEC} ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating documentation with ${DOXYGEN_EXEC}"
    )
  endif()

  if(CMAKE_DOXYGEN_FLAT_THEME)
    add_custom_target(Doxygen_Flat ALL
      COMMAND
      HTML_OUTPUT=html_flat_theme
      DOXYGEN_OUTPUT_DIRECTORY=${AUTODOC_DIR}/doxygen
      DOXYGEN_LAPKT_SOURCE_DIR=${PROJECT_SOURCE_DIR}/src
      DOXYGEN_LAPKT_DEV_GUIDE_DIR=${PROJECT_SOURCE_DIR}/developersguide
      DOXYGEN_EXCLUDE=${PROJECT_SOURCE_DIR}/developersguide/debug_snippet.py
      DOXYGEN_THEME_CSS=doxygen_flat_design/doxygen-style.css
      DOXYGEN_EXTRA_FILES=doxygen_flat_design/img
      DOXYGEN_GENERATE_LATEX=NO
      DOXYGEN_GENERATE_XML=NO
      DOXYGEN_LAPKT_LOGO=img/white_logo_small.png
      DOXYGEN_QUIET=YES
      ${DOXYGEN_EXEC} ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating documentation with ${DOXYGEN_EXEC}"
    )
  endif()

  add_custom_target(Doxygen ALL
    COMMAND
    HTML_OUTPUT=html_default_theme
    DOXYGEN_OUTPUT_DIRECTORY=${AUTODOC_DIR}/doxygen
    DOXYGEN_LAPKT_SOURCE_DIR=${PROJECT_SOURCE_DIR}/src
    DOXYGEN_LAPKT_DEV_GUIDE_DIR=${PROJECT_SOURCE_DIR}/developersguide
    DOXYGEN_EXCLUDE=${PROJECT_SOURCE_DIR}/developersguide/debug_snippet.py
    DOXYGEN_GENERATE_LATEX=YES
    DOXYGEN_GENERATE_XML=YES
    DOXYGEN_THEME_CSS=doxygen_default_design/custom.css
    DOXYGEN_LAPKT_LOGO=img/logo_small.png
    DOXYGEN_QUIET=YES
    ${DOXYGEN_EXEC} ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Generating documentation with ${DOXYGEN_EXEC}"
  )
  #---- END Doxygen configuration ----#

endif(CMAKE_DOXYGEN_DOCS AND Doxygen_FOUND AND LINUX_BUILD)

if(CMAKE_SPHINX_DOCS AND Doxygen_FOUND AND LINUX_BUILD)
    #---- BEGIN Sphinx Exhale autodocumentation ----#
    find_package(Sphinx REQUIRED)
    file(MAKE_DIRECTORY ${PROJECT_BINARY_DIR}/docs/sphinx)
    set(SPHINX_SOURCE ${PROJECT_BINARY_DIR}/docs/sphinx)
    set(SPHINX_BUILD ${PROJECT_BINARY_DIR}/docs/sphinx/html)
    #---- Copy configuration to the docs dir ----#
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/conf.py ${SPHINX_SOURCE} COPYONLY)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/index.rst ${SPHINX_SOURCE} COPYONLY)
    add_custom_target(Sphinx ALL
        COMMAND 
        DOXYGEN_OUTPUT_DIRECTORY=${AUTODOC_DIR}/doxygen/xml
        ${SPHINX_EXEC} -b html
        ${SPHINX_SOURCE} ${SPHINX_BUILD}
        WORKING_DIRECTORY ${SPHINX_SOURCE}
        DEPENDS Doxygen
        COMMENT "Generating documentation with Sphinx")
    
    #---- END Sphinx Exhale autodocumentation ----#
endif(CMAKE_SPHINX_DOCS AND Doxygen_FOUND AND LINUX_BUILD)

