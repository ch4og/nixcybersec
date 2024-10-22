{
  description = "Cybersecurity tools for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?rev=f02308bfe52ff4de092dd3e592dc44e844d1058a"; # https://nixpk.gs/pr-tracker.html?pr=350385
    binsider = {
      url = "github:orhun/binsider";
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
        overlays = [
          (final: prev: {
            binsider = inputs.binsider.packages.${prev.system};
          })
        ];
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
