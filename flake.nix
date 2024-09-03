{
  description = "Cybersecurity tools for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # or a specific version
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        config.permittedInsecurePackages = [ "python-2.7.18.8" ];
      };
    in {
      devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        buildInputs = (import ./pkgs.nix { inherit pkgs; });
        shellHook = builtins.replaceStrings [ "SELF_HERE" ] [ (toString self) ]
          (builtins.readFile ./hook.sh);
      };
    };
}
