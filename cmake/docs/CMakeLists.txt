#---- BEGIN Auto doc configuration ----#
#### Generate Auto documentation


set(LINUX_BUILD OFF)
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux" OR CYGWIN)
  set(LINUX_BUILD ON)
endif()

if(GEN_DOXYGEN_DOCS OR GEN_DOXYSPHINX_DOCS)
  if(LINUX_BUILD)
    find_package(Doxygen)
    if(Doxygen_FOUND)
      message(${DOXYGEN_EXEC} " will be used to generate C++ documentation")
    else()
      message(WARNING "Source code documentation cannot be generated since Doxygen wasn't found")
    endif(Doxygen_FOUND)
  else()
    message(WARNING 
    "Source code autodocumentation will not be generated since Doxygen is not configured for Non-Linux systems")
  endif(LINUX_BUILD)
endif(GEN_DOXYGEN_DOCS OR GEN_DOXYSPHINX_DOCS)

if(GEN_DOXYGEN_DOCS AND Doxygen_FOUND AND LINUX_BUILD)
  # output directory for doxygen
  set(OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/docs/doxygen)

  # Create necessary directories
  add_custom_target(make_doxygen_output_directory ALL
    COMMAND ${CMAKE_COMMAND} -DOUTPUT_DIRECTORY=${OUTPUT_DIRECTORY} -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake_dir_setup.cmake"
  )

  add_custom_target(doxygen ALL
    COMMAND
    HTML_OUTPUT=html_default_theme
    DOXYGEN_OUTPUT_DIRECTORY=${OUTPUT_DIRECTORY}
    DOXYGEN_LAPKT_SOURCE_DIR=${PROJECT_SOURCE_DIR}/src
    DOXYGEN_LAPKT_DEV_GUIDE_DIR=${PROJECT_SOURCE_DIR}/developersguide
    DOXYGEN_EXCLUDE=${PROJECT_SOURCE_DIR}/developersguide/debug_snippet.py
    DOXYGEN_GENERATE_LATEX=NO
    DOXYGEN_GENERATE_XML=NO
    DOXYGEN_LAPKT_LOGO=resources/logo/logo-no-background.png
    DOXYGEN_QUIET=YES
    ${DOXYGEN_EXEC} ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile
    DEPENDS make_doxygen_output_directory
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    COMMENT "Generating documentation with ${DOXYGEN_EXEC}"
  )
  #---- END Doxygen configuration ----#
endif(GEN_DOXYGEN_DOCS AND Doxygen_FOUND AND LINUX_BUILD)

if(GEN_DOXYSPHINX_DOCS AND Doxygen_FOUND AND LINUX_BUILD)
  # install dependencies
  execute_process(COMMAND ${Python_EXECUTABLE} -m pip install --user
    -r ${PROJECT_SOURCE_DIR}/cmake/docs/doxysphinx/pip_requirements.txt
    RESULT_VARIABLE out
  )

  # source directory for sphinx-build and doxysphinx
  set(DOXYSPHINX_SOURCE ${PROJECT_SOURCE_DIR})

  # output directory for doxysphinx
  set(OUTPUT_DIRECTORY ${DOXYSPHINX_SOURCE}/docs/doxysphinx)

  # Create necessary directories
  add_custom_target(make_doxysphinx_output_directory ALL
    COMMAND ${CMAKE_COMMAND} -DOUTPUT_DIRECTORY=${OUTPUT_DIRECTORY} -P "${CMAKE_CURRENT_SOURCE_DIR}/cmake_dir_setup.cmake"
  )

  # output directory for sphinx-build and doxysphinx
  set(HTML_DIRECTORY ${OUTPUT_DIRECTORY}/html)

  set(DOXYFILE_PATH ${PROJECT_SOURCE_DIR}/cmake/docs/doxysphinx/Doxyfile)

  add_custom_target(doxygen_for_doxysphinx ALL
  COMMAND
    ${DOXYGEN_EXEC} ${DOXYFILE_PATH}
    DEPENDS make_doxysphinx_output_directory
    WORKING_DIRECTORY ${DOXYSPHINX_SOURCE}
    COMMENT "Generating documentation with ${DOXYGEN_EXEC}"
  )

  #---- BEGIN doxysphinx modifications ----#
  find_package(Doxysphinx REQUIRED)
  #---- Copy configuration to the docs dir ----#

  add_custom_target(doxysphinx ALL
    COMMAND 
    ${DOXYSPHINX_EXEC} build
    ${DOXYSPHINX_SOURCE} ${HTML_DIRECTORY} 
    ${DOXYFILE_PATH}
    --doxygen_exe ${DOXYGEN_EXEC}
    --doxygen_cwd ${DOXYSPHINX_SOURCE}
    WORKING_DIRECTORY ${DOXYSPHINX_SOURCE}
    DEPENDS doxygen_for_doxysphinx 
    COMMENT "Doxysphinx::Updating doxygen documentation"
  )
  #---- END doxysphinx modifications ----#

  #---- BEGIN Sphinx  autodocumentation ----#
  find_package(Sphinx REQUIRED)
  #---- Copy configuration to the docs dir ----#

  add_custom_target(sphinx ALL
    COMMAND 
    DOXYGEN_OUTPUT_DIRECTORY=${HTML_DIRECTORY}
    ${SPHINX_EXEC} -b html
    ${DOXYSPHINX_SOURCE} ${HTML_DIRECTORY}
    WORKING_DIRECTORY ${DOXYSPHINX_SOURCE}
    DEPENDS doxysphinx
    COMMENT "Sphinx::Generating rtd documentation"
  )
  
  #---- END Sphinx  autodocumentation ----#




endif(GEN_DOXYSPHINX_DOCS AND Doxygen_FOUND AND LINUX_BUILD)

