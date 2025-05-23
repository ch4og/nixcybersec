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

#### Python 2

Python 2 is not included here cause it's EOL. It is commonly used for printing
correct bytes

Reason why is this behavior:

```sh
$ python2 -c 'print("\xFF")' | hexdump
0000000 0aff
0000002

$ python3 -c 'print("\xFF")' | hexdump
0000000 bfc3 000a
0000003
```

The easy way to print bytes with python3 that I use is:

```sh
$ python3 -c '__import__("os").write(1,b"\xFF\n")' | hexdump
0000000 0aff
0000002
```

Where `1` is stdout file descriptor.

Or even better use perl:
```sh
perl -e 'print "\xFF\n"' | hexdump
0000000 0aff
0000002
```

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

#### Dynamic executables

Since NixOS by design prevents running dynamically linked executables, 
this flake uses FHS as wrapper for your preffered shell. 

`fhs` command runs automatically as a shell hook
