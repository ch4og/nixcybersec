{ pkgs, packages_all, name, ... }:
let
  packages =
    if name == "default" then
      pkgs.lib.flatten (builtins.attrValues packages_all)
    else
      packages_all.${name} ++ packages_all.general;
  packageDescriptions = builtins.map (p: ''\033[0;32m${p.pname or ( builtins.head (pkgs.lib.strings.splitString "-" p.name)) }\033[0m - ${p.meta.description or "No description"}'') (packages);

in
packageDescriptions
