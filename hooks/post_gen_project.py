#!/usr/bin/env python
import os
import shutil

PROJECT_DIRECTORY = os.path.realpath(os.path.curdir)


def remove_file(filepath):
    os.remove(os.path.join(PROJECT_DIRECTORY, filepath))

def remove_dir(filepath):
    shutil.rmtree(os.path.join(PROJECT_DIRECTORY, filepath))



if __name__ == '__main__':

    if '{{ cookiecutter.is_webapp}}' != 'y':
      remove_file('nix/docker.nix')
      remove_dir('config')

    if '{{ cookiecutter.has_executable}}' != 'y':
      remove_dir('app')

    if '{{ cookiecutter.is_open_source}}' != 'y':
        remove_file('LICENSE')
