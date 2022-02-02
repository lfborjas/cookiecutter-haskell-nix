# Haskell + nix cookiecutter

Generates an app, lib or webapp. For webapps, a heroku.yml github workflow is provided.

## Usage

* [Install cookiecutter](https://cookiecutter.readthedocs.io/en/2.0.2/installation.html)
* Follow the prompts: you can generate a library, with an optional executable; there's also the option to generate a web app, which will add the `docker.nix` derivation, as well as the `heroku.yml` github workflow, in addition to some libraries I use in all my webapps.

## TODO

* Test boilerplate, opt-in.
