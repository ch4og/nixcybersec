# NixCyberSec

### This is a flake that can be used to run shell with cybersecurity tools.

This flake uses unfree software!
Also since python2 is EOL it is in unsafe packages list.

## Usage

```bash
nix develop github:ch4og/nixcybersec
```

And of course you can create an alias for it

bash:

```nix
bash.shellAliases = {
  cybersec = "nix develop github:ch4og/nixcybersec";
};
```

zsh:

```nix
zsh.shellAliases = {
  cybersec = "nix develop github:ch4og/nixcybersec -c zsh";
};
```

TODO:

- [ ] Make tools script give info about each tool
- [ ] Create some kind of modularity for the tools
