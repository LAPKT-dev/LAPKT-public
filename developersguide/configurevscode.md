# VSCode configuration

VSCode has an active community of developers who maintain many useful extensions. This guide would help a user get started with LAPKT development using VSCode

### General tips for VSCode configuration

- The VSCode user settings are store in a `json` at `{workspaceFolder}/.vscode/settings.json`
- The program launch(run/run-debug) configuration are at `{workspaceFolder}/.vscode/launch.json`
- The default template for configuration can be added using `Add Configuration` option in the GUI menu.
- `Ctrl+Shift+P` opens the command interface.

### Recommended VSCode Extensions

- ms-vscode.cpptools
  - C/C++ extensions

- ms-vscode.cpptools-extension-pack
  - C/C++ extensions

- vadimcn.vscode-lldb
  - to debug on macos
  
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