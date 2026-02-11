{
  description = "Cyberchallenge flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          php
          python313
          python313Packages.pip
          python313Packages.pycryptodome
          python313Packages.pwntools
          python313Packages.requests
          python313Packages.pyshark
          python313Packages.ropper
          javaPackages.compiler.openjdk21
          ngrok
          binwalk
          gimp
          john # John The Ripper
          ltrace
          patchelf
          elfutils
          ruby
          ghidra
          burpsuite
          checksec
        ];

        shellHook = ''
          exec zsh
        '';
      };
    };
}
