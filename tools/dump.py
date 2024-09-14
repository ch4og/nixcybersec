import subprocess
import json


def get_all_packages():
    packages = []
    inlist = False
    with open("../pkgs.nix", "r") as f:
        for line in f:
            if "[" in line and "++" in line:
                continue
            elif "]" in line and ";" not in line:
                continue
            elif "inputs" in line:
                continue
            elif "with pkgs;" in line:
                inlist = True
                continue
            elif inlist and "];" not in line:
                packages.append(line.strip())
            elif inlist and "];" in line:
                inlist = False
    return packages


def package_description(package):
    result = subprocess.run(
        [
            "nix-instantiate",
            "--eval",
            "-E",
            "with import <nixpkgs> {};" + f"{package}.meta.description",
        ],
        capture_output=True,
        text=True,
        check=True,
    )
    return result.stdout.strip().strip('"')


pkgs_with_descriptions = {}
for package in get_all_packages():
    pkgs_with_descriptions[package] = package_description(package)

with open("desc.json", "w") as f:
    json.dump(pkgs_with_descriptions, f, indent=2)
