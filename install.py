#!/usr/bin/env python3
from argparse import ArgumentParser
from os.path import isfile, isdir, join
from os import access, X_OK, environ, pathsep
from subprocess import run
from multiprocessing import cpu_count
from importlib.util import find_spec as find_module
from sys import executable, version_info
from shutil import rmtree, copy

from tools import download_extract

SRC_PATH    =   'src'
README_PATH =   'README.md'
LICENSE_PATH=   'LICENSE.txt'

def user_agreement(conditions, option='n') :
    if option in ['n','N'] :
        prompt = ' [y/N]'
    elif option in ['y' or 'Y'] :
        prompt = ' [Y/n]'
    else :
        raise ValueError('Prompt option is invalid!')

    user_in = input(conditions+prompt)
    
    if user_in in ['n','N'] :
        return False
    elif user_in in ['y','Y'] :
        return True
    else:
        return True if option in ['y' or 'Y'] else False

def exists_exec(runfile, name):
    if args.cmake and isfile(runfile) and access(runfile, X_OK) :
        return args.cmake
    elif any([isfile(join(path, name)) and 
            access(join(path, name), X_OK) 
            for path in environ["PATH"].split(pathsep)]) :
        return name
    else :
        print("Please install external dependency: " + name)
        exit()

def exists_python_module(name) :
    try :
        return bool(find_module(name))
    except ImportError:
        return False

if __name__ == '__main__' :
    assert version_info >= (3,7,0), 'Python >= 3.7 required'

    parser  =   ArgumentParser(description="Take LAPKT installation options")    
    parser.add_argument('--cmake', action='store', nargs='?',
            help='Path to cmake exec')
    parser.add_argument('--git', action='store', nargs='?',
            help='Path to git exec')
    parser.add_argument('--additional_package', action='store', nargs='*',
            choices=['FF_Parser', 'FD_Translate', 'Validate', 'Lab_module', 'all'],
            help='Choice of external components with GPLv3 License')
    parser.add_argument('--cmake_build_options', action='store', nargs='?',
            choices=['Release', 'Debug'], default='Release',
            help='cmake build options')
    parser.add_argument('--cmake_component', action='store', nargs='?',
            choices=['Development', 'Runtime'], default='Development',
            help="Development - with headers files, Runtime - without")
    parser.add_argument('--build_dir', action='store', nargs='?', 
            default='build', help='dir path, where build files will be stored')
    parser.add_argument('--install_dir', action='store', nargs='?', 
            default='release', help='dir path, where libraries will be stored')
    parser.add_argument('--clean', action='store_true', 
            default=False, help='cleans build and install directories')
    args = parser.parse_args()

    if args.clean :
        if isdir(join(args.build_dir,)) :
            rmtree(join(args.build_dir,))
        if isdir(args.install_dir) :
            rmtree(args.install_dir)
        exit()

    # Check whether necesary executables and libs exist
    cmake_exec  =   exists_exec(args.cmake, 'cmake')
    git_exec  =   exists_exec(args.git, 'git')
    if not exists_python_module('pip') :
        print('Install python pip module')
        exit()
    if not exists_python_module('tarski') and\
                run([executable, '-m', 'pip', 'install', 'tarski'], 
                check=True).returncode :
            print('Installation of tarski library failed')
            exit()
    if not exists_python_module('ruamel.yaml') and\
                run([executable, '-m', 'pip', 'install', 'ruamel.yaml'], 
                check=True).returncode :
            print('Installation of yaml library failed')
            exit()
    if not exists_python_module('psutil') and\
                run([executable, '-m', 'pip', 'install', 'psutil'], 
                check=True).returncode :
            print('Installation of psutil library failed')
            exit()
        
    cmake_configure =   [cmake_exec, '--clean-first',]
    cmake_build     =   [cmake_exec,]
    cmake_install   =   [cmake_exec,]

    # Apply build_dir
    cmake_configure +=  ['-B', join(args.build_dir, 'lapkt'), '-S', SRC_PATH,
            '-DCMAKE_INSTALL_PREFIX='+args.install_dir]
    cmake_build     +=  ['--build', join(args.build_dir,'lapkt'),'-j'+str(cpu_count())]
    #cmake_install   +=  ['--install', args.build_dir]
    cmake_install   +=  ['--install', join(args.build_dir, "lapkt")]

    # Choice of additional components 'FF_Parser', 'FD_Translate', 'Validate'
    if args.additional_package and user_agreement("All additional features "+
            "require external packages with GPLv3 license. Read the license at "+
            "https://www.gnu.org/licenses/gpl-3.0.en.html. Do you wish to "+
            "continue? ", 'n') :
        git_fetch_modules = [git_exec, 'submodule', 'update', '--init']
        if 'all' in args.additional_package :
            if run(git_fetch_modules).returncode:
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_VAL=ON']
                cmake_configure +=  ['-DCMAKE_FF=ON']
                cmake_configure +=  ['-DCMAKE_FD=ON']
        if 'Lab_module' in args.additional_package:
            if run(git_fetch_modules+['lab_experiment_module']).returncode:
                print('error fetching submodule', 'lab_experiment_module')
                exit()
        if 'FF_Parser' in args.additional_package:
            if run(git_fetch_modules+['src/external/libff']).returncode:
                print('error fetching submodule', 'FF')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_FF=ON']
        if 'FD_Translate' in args.additional_package :
            if run(git_fetch_modules+['src/external/fd']).returncode:
                print('error fetching submodule', 'FD')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_FD=ON']
        if 'Validate' in args.additional_package :
            if run(git_fetch_modules+['src/external/VAL-4.2.08']).returncode:
                print('error fetching submodule', 'Validate')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_VAL=ON']
        
        if ('Lab_module' in args.additional_package
                or  'all' in args.additional_package) :
            if not exists_python_module('lab') and\
                run([executable, '-m', 'pip', 'install', 'lab'], 
                check=True).returncode :
                print('Installation of downward lab library failed')
                exit()
    
    # Pass python version
    cmake_configure.append('-DCMAKE_PYTHON_VERSION='+str(version_info[0])+
            str(version_info[1]))

    # Choice of cmake_build_options
    if args.cmake_build_options:
        cmake_configure.append('-DCMAKE_BUILD_TYPE='+args.cmake_build_options)

    # Choice of build components
    if args.cmake_component:
        cmake_install   += ['--component', args.cmake_component]

    # run cmake configure
    x = not run(cmake_configure).returncode
    # run cmake build
    if x :
        x = not run(cmake_build).returncode
    # run cmake install
    if x :
        x = not run(cmake_install).returncode
        if isfile(README_PATH) :
           copy(README_PATH, args.install_dir)
        if isfile(LICENSE_PATH) :
           copy(LICENSE_PATH, args.install_dir)
        if run([executable, '-m', 'pip', 'install', '-e', args.install_dir],
                check=True).returncode :
            print('Installation of lapkt library failed')
            exit()

