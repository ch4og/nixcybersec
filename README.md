# NixCyberSec

### This is a flake that can be used to run shell with cybersecurity tools.

This flake uses unfree software! Also since python2 is EOL it is in unsafe
packages list.

## Usage

```bash
nix develop github:ch4og/nixcybersec
```

#### To list or search tools there is `tools` command.

#### You can also create shell alias for this flake:

```nix
bash.shellAliases = {
  cybersec = "nix develop github:ch4og/nixcybersec";
};
```

So you will be able to run shell with cybersec tools with `cybersec` command.

Or specific tool with `cybersec -c <tool>`

### TODO:

- [ ] Make script to connect to HTB/THM VPNs fast
- [ ] Make tools script give info about each tool
- [ ] Create some kind of modularity for the tools
- [ ] Way to temporarily add to hosts
