{ pkgs ? import ./packages.nix { system = "x86_64-linux"; } }:

let
  bin = (pkgs.haskell.lib.justStaticExecutables (pkgs.haskell.lib.dontCheck pkgs.haskellPackages.{{cookiecutter.project_slug}}));
  config = ../config;
in

# This is the nix api to build images
pkgs.dockerTools.buildImage {
  # our image name
  name = "{{cookiecutter.project_slug}}";
  # our image tag
  tag = "latest";
  
  # this is a list of the things we want to include
  # in the image. it's incredibly bare by default.
  contents = [
    bin # our app
  ];
  fromImage = pkgs.dockerTools.pullImage {
    imageName = "alpine";
    imageDigest = "sha256:e1871801d30885a610511c867de0d6baca7ed4e6a2573d506bbec7fd3b03873f";
    sha256 = "0ymhp3hrhpf7425n3awz6b67510x9xcgpldi4xm610aqfk1rygy9";
  };
  #
  extraCommands = ''
    cp -rf ${config} config
    chmod -R 777 config
  '';

  # This exposes the Dockerfile commands you might be familiar with
  config = {
    Cmd = [ "${bin}/bin/{{cookiecutter.project_slug}}-exe" ];
    Env = [ 
      "DEPLOY_ENV=Production"
    ];
  };
}
