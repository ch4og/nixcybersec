# NixCyberSec

## This is a flake that can be used to run shell with cybersecurity tools.

### Usage

```bash
nix develop github:ch4og/nixcybersec
```

Or if you want to use specific category:

```bash
nix develop github:ch4og/nixcybersec#<category>
```

To list tools there is `tools` command. You can use `grep` with it to search for
specific tool.

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

- [x] Make tools script give info about each tool
- [x] Create separate devshells for each category
