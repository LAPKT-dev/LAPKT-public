#! /usr/bin/env python3
from tarfile import is_tarfile, open as opentar
from zipfile import ZipFile
from requests import get
from argparse import ArgumentParser
from io import BytesIO
from os.path import basename, splitext

#-----------------------------------------------------------------------------#
def extract_tar(url, extract_to) :
    fstream =   BytesIO(get(url).content)
    tar_arc =   opentar(fileobj=fstream)
    tar_arc.extractall(path=extract_to)

#-----------------------------------------------------------------------------#
def extract_zip(url, extract_to) :
    fstream =   BytesIO(get(url).content)
    zip_arc =   ZipFile(fstream)
    zip_arc.extractall(path=extract_to)

#-----------------------------------------------------------------------------#
def download_extract(url : str, extract_to : str) :
    f       =   basename(url).split(".")
    fname   =   f[0]
    fext    =   f[1 : ]
    if ('tar' in fext) :
        extract_tar(url, extract_to)
        return 0
    elif ('zip' in fext):
        extract_zip(url, extract_to)
        return 0
    else :
        return -1

#-----------------------------------------------------------------------------#
if __name__ == "__main__" :
    parser = ArgumentParser()
    parser.add_argument('-u', '--url', action='store', 
            nargs='?', required=True)
    parser.add_argument('-e', '--extract_to', action='store', 
            nargs='?', required=False, default='.')
    args = parser.parse_args() 

    if not download_extract(args.url, args.extract_to) == 9 :
        print("Only urls leading to a zip or tar archive are accepted")
