args@{ inputs, self, pkgs, ... }:
let
  packages = import ./pkgs.nix args;
  generalPackages = packages.general;
  hook = builtins.replaceStrings [ "SELF_HERE" ] [ (toString self) ] (builtins.readFile ./hook.sh);

  shells = builtins.mapAttrs
    (n: v: pkgs.mkShell {
      packages = v ++ generalPackages;
      name = n;
      shellHook = hook;
    })
    packages;
in
shells
  // {
  default = pkgs.mkShell {
    packages = pkgs.lib.flatten (builtins.attrValues packages);
    name = "default";
    shellHook = hook;
  };
}
