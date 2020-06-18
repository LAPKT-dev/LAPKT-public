#! /usr/bin/python3
from argparse import ArgumentParser
from os.path import isfile, join
from os import access, X_OK, environ, pathsep
from subprocess import run
from multiprocessing import cpu_count
from importlib.util import find_spec as find_module
from sys import executable

SRC_PATH='./src'

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
        print("Please install external dependency" + name)
        exit()

def exists_python_module(name) :
    try :
        return bool(find_module(name))
    except ImportError:
        return False

if __name__ == '__main__' :
    parser  =   ArgumentParser(description="Take LAPKT installation options")    
    parser.add_argument('--cmake', action='store', nargs='?',
            help='Path to cmake exec')
    parser.add_argument('--git', action='store', nargs='?',
            help='Path to git exec')
    parser.add_argument('--additional_features', action='store', nargs='*',
            choices=['FF_Parser', 'FD_Translate', 'Validate', 'all'],
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
    args = parser.parse_args()

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
        
    cmake_configure =   [cmake_exec, '--clean-first',]
    cmake_build     =   [cmake_exec,]
    cmake_install   =   [cmake_exec,]

    # Apply build_dir
    cmake_configure +=  ['-B', args.build_dir, '-S', SRC_PATH, 
            '-DCMAKE_INSTALL_PREFIX='+args.install_dir ]
    cmake_build     +=  ['--build', args.build_dir,'-j'+str(cpu_count())]
    cmake_install   +=  ['--install', args.build_dir]

    # Choice of additional components 'FF_Parser', 'FD_Translate', 'Validate'
    if args.additional_features and user_agreement("All additional features "+
            "require external packages with GPLv3 license. Read the license at "+
            "https://www.gnu.org/licenses/gpl-3.0.en.html. Do you wish to "+
            "continue? ", 'n') :
        git_fetch_modules = [git_exec, 'submodule', 'update', '--init']
        if 'all' in args.additional_features and run(git_fetch_modules).returncode:
            exit()
        if 'Lab_module' in args.additional_features:
            if run(git_fetch_modules+['lab_experiment_module']).returncode:
                print('error fetching submodule', 'lab_experiment_module')
                exit()
        if 'FF_Parser' in args.additional_features:
            if run(git_fetch_modules+['src/external/libff']).returncode:
                print('error fetching submodule', 'FF')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_FF=ON']
        if 'FD_Translate' in args.additional_features :
            if run(git_fetch_modules+['src/external/fd']).returncode:
                print('error fetching submodule', 'FD')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_FD=ON']
        if 'Validate' in args.additional_features :
            if run(git_fetch_modules+['src/external/VAL-4.2.08']).returncode:
                print('error fetching submodule', 'Validate')
                exit()
            else :
                cmake_configure +=  ['-DCMAKE_VAL=ON']
    
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
