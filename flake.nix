{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    flake-compat.url = "github:edolstra/flake-compat";
    flake-compat.flake = false;
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , nix-index-database
    , ...
    }:
    let
      env = import ./env.nix;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # For Nix package manager only
      homeConfigurations.${env.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ({ config, pkgs, ... }: import ./home.nix { inherit config pkgs self env; })
          ({ config, pkgs, ... }: env.extraConfig { inherit config pkgs self; })
          nix-index-database.hmModules.nix-index
        ];
      };
    };
}
