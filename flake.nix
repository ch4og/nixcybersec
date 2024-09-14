{
  description = "Cybersecurity tools for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    binsider = {
      url = "github:ch4og/binsider";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowInsecurePredicate = p: true;
        };
      };
    in
    {
      devShells.x86_64-linux = import ./shells.nix {
        inherit pkgs;
        inherit self;
        inherit inputs;
      };
    };
}
