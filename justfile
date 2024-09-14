# list all available commands
default:
	@just --list

# genereate description for all packages
desc:
  cd tools && python3 dump.py

# update all packages
update:
  git add -A
  nix flake update
