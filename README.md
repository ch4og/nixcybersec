# NixCyberSec

## This is a flake that can be used to run shell with cybersecurity tools.

### Usage

```bash
nix develop github:ch4og/nixcybersec
```

### Notes

#### List of tools

To get list of tools you can use `echo -e $sectools` command.

#### Categories

If you want to use specific category:

```bash
nix develop github:ch4og/nixcybersec#<category>
```

- `default` - all tools (unbelievable but it's default)
- `general` - tools that can be used in any category
- `reverse` - reverse engineering and pwn tools
- `cracking` - cracking tools
- `exploits` - tools for exploiting
- `web` - web tools
- `network` - network tools
- `forensics` - forensics tools
- `windows` - windows tools

#### Wordlists

Since Nix is immutable you can't put wordlists to `/usr/share/wordlists`

To show all wordlists locations just use `wordlists` command.

#### Shell alias

You can create alias for devshell like this:

```nix
bash.shellAliases = {
  cybersec = "nix develop github:ch4og/nixcybersec";
};
```

Now you can use `cybersec` command to enter devshell or `cybersec -c <tool>` to
run specific tool.

#### Add to hosts

If you want to temporarily add any hosts it's not possible to do it on NixOS

I recommend using DNS server with rewrites (for example NextDNS)

Also you can rebuild system every time you want to add new hosts but it's not
very convenient.

#### Wireshark

If you plan to use wireshark please note that it will work only with root
privileges.

So you can use `sudo -E wireshark` to run wireshark with root privileges.
