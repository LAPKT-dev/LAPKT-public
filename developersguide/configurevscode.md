# IDE: VSCode configuration {#vscode}

@tableofcontents

### Why do I need this?

VSCode has an active community of developers which has lead to creation of highly useful community developed extensions which are regularly updated. Even if you plan to use a different IDE, we highly recommend configuring it with the following features.

1. Auto-generate `Doxygen` compatible comment blocks.
2. Linter for C++17 or higher.

### General tips for VSCode configuration

- The VSCode user settings are store in a `json` at `{workspaceFolder}/.vscode/settings.json`
- The program launch(run/run-debug) configuration are at `{workspaceFolder}/.vscode/launch.json`
- The default template for configuration can be added using `Add Configuration` option in the GUI menu.
- `Ctrl+Shift+P` opens the command interface.

### Recommended VSCode Extensions (extension id)

- ms-vscode.cpptools
  - Recommended C/C++ extension settings
        
        "C_Cpp.default.cppStandard": "c++17"
  
- ms-vscode.cpptools-extension-pack
  
- cschlosser.doxdocgen(installed along with ms-vscode.cpptools-extension-pack)
  - Automatically generates comment blocks that parsed by Doxygen to generate source documentation
  - Personalize comments including author name and email in extension settings
 
        "doxdocgen.generic.authorEmail": "<Your email>",
        "doxdocgen.generic.authorName": "<Your name>",
        "doxdocgen.file.customTag": ["<Some additional text which you want to include along with file comments>"]

- ms-vscode.cmake-tools

  - Configuring source and build directories is necessary when using the `cmake` extension in VSCode.

        "cmake.sourceDirectory": "<src_dir>",
        "cmake.buildDirectory" : "<build_dir>",

  - A typical configuration may look like this.

        "cmake.sourceDirectory": "${workspaceFolder}/src",
        "cmake.buildDirectory" : "${workspaceFolder}/build",

- twxs.cmake (cmake language support)
- ms-python.python
- ms-python.vscode-pylance
- littlefoxteam.vscode-python-test-adapter

