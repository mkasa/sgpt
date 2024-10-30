# This flake was initially generated by fh, the CLI for FlakeHub (version 0.1.18)
{
  # Flake inputs
  inputs = {
    flake-schemas.url = "https://flakehub.com/f/DeterminateSystems/flake-schemas/*";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  # Flake outputs that other flakes can use
  outputs = { self, flake-schemas, nixpkgs, unstable }:
    let
      # Helpers for producing system-specific outputs
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" "aarch64-linux" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
        unstable = import unstable { inherit system; };
      });
    in {
      # Schemas tell Nix about the structure of your flake's outputs
      schemas = flake-schemas.schemas;

      # Development environments
      devShells = forEachSupportedSystem ({ pkgs, unstable }: {
        default = pkgs.mkShellNoCC {
          # Pinned packages available in the environment
          packages = [
            pkgs.go-task
            pkgs.pre-commit
            pkgs.commitizen
            pkgs.goreleaser
            pkgs.golangci-lint
            pkgs.govulncheck
            pkgs.svu
            pkgs.addlicense
            pkgs.mkdocs
            pkgs.python311Packages.mkdocs-material
            pkgs.nixpkgs-fmt
          ];
        };
      });
    };
}
