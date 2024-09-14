# NixCyberSec

## This is a flake that can be used to run shell with cybersecurity tools.

This flake uses unfree software! Also since Python 2 is EOL it is in unsafe
packages list.

### Usage

```bash
nix develop github:ch4og/nixcybersec
```

To list or search tools there is `tools` command.

You can also create shell alias for this flake:

```nix
bash.shellAliases = {
  cybersec = "nix develop github:ch4og/nixcybersec";
};
```

So you will be able to run devshell with `cybersec` command.

Or specific tool with `cybersec -c <tool>`

### Notes

#### Add to hosts

If you want to temporarily add any hosts it's not possible to do it on NixOS

I recommend using DNS server with rewrites (for example NextDNS)

Also you can rebuild system every time you want to add new hosts but it's not
very convenient.

#### Wireshark

If you plan to use wireshark please note that it will work only with root
privileges.

So you can use `sudo -E wireshark`.

### TODO:

- [ ] Make tools script give info about each tool
- [ ] Create separate devshells for each category
