# list all available commands
default:
	@just --list

# run shell
develop:
  git add -A
  nix develop
