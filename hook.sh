echo -e "Welcome to \033[0;34mnixcybersec\033[0m#\033[0;32m$(echo $name | sed 's/-env//')\033[0m by \e]8;;http://github.com/ch4og/nixcybersec\e\\@ch4og\e]8;;\e\\!"
echo -e "To list tools use \033[0;32mtools\033[0m command"
export PATH_CYBERSEC=SELF_HERE
export PATH=$PATH:$PATH_CYBERSEC/tools/bin
