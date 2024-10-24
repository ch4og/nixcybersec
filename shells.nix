args @ {
  inputs,
  self,
  pkgs,
  ...
}: let
  packages_all = import ./pkgs.nix args;
  generalPackages = packages_all.general;

  shells =
    builtins.mapAttrs (
      n: v:
        pkgs.mkShell rec {
          packages = v ++ generalPackages;
          name = n;
          shellHook =
            builtins.replaceStrings
            [
              "TOOLS_HERE"
              "PATH_HERE"
            ]
            [
              (builtins.concatStringsSep "\\n" (
                import ./tools/desc.nix {
                  inherit
                    pkgs
                    packages_all
                    args
                    name
                    ;
                }
              ))
              (toString self)
            ]
            (builtins.readFile ./tools/hook.sh);
        }
    )
    packages_all;
in
  shells
  // {
    default = pkgs.mkShell rec {
      packages = pkgs.lib.flatten (builtins.attrValues packages_all);
      name = "default";
      shellHook =
        builtins.replaceStrings
        [
          "TOOLS_HERE"
          "PATH_HERE"
        ]
        [
          (builtins.concatStringsSep "\\n" (
            import ./tools/desc.nix {
              inherit
                pkgs
                packages_all
                args
                name
                ;
            }
          ))
          (toString self)
        ]
        (builtins.readFile ./tools/hook.sh);
    };
  }
