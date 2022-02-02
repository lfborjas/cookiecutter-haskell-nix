let
  pkgs = import ./packages.nix {};
in
  { {{cookiecutter.project_slug}} = pkgs.haskellPackages.{{cookiecutter.project_slug}}; }
