#
# ~/.bashrc
#
clear && fastfetch
#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Path to bat config
export BAT_CONFIG_PATH="~/.config/bat/config.conf"

# Oh-My-Posh Config
eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/xero.omp.json)"

# Special Clear Message
alias clsm='clear && figlet -c -t -f small "Welcome to XeroLinux, ${USER^^}" | lolcat'
alias xff='clear && fastfetch --config ~/.config/fastfetch/stationxero.jsonc'

# Replace stuff with bat
alias cat='bat '
alias rg='batgrep '
alias tl='tldr '

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#ignore upper and lowercase when TAB completion
bind 'set completion-ignore-case on'

#systeminfo
alias probe='sudo -E hw-probe -all -upload'

# Replace ls with exa
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l='eza -lah --color=always --group-directories-first --icons' # tree listing

#available free memory
alias free='free -mt'

#continue download
alias wget='wget -c'

#readable output
alias df='df -h'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

#userlist
alias userlist='cut -d: -f1 /etc/passwd'

#Pacman for software managment
alias search='pacman -Ss '
alias remove='sudo pacman -Rs '
alias pacin='sudo pacman -S'
alias linstall='sudo pacman -U *.pkg.tar.zst'
alias update='sudo pacman -Syyu && flatpak update'
alias clrcache='sudo pacman -Scc'
alias orphans='[[ -n $(pacman -Qtdq) ]] && sudo pacman -Rns $(pacman -Qtdq)'
alias pup='sudo pacman -Syu'
alias plist='pacman -Ql '
alias pforeign='pacman -Qm'
alias pown='pacman -Qo '
alias pfiles='pacman -Fl '
alias pcheck='sudo pacman -Dk'
alias punused='pacman -Qtd'
alias psize="expac -H M '%m\t%n' | sort -h | tail -20"
alias pdiff='sudo pacdiff'
alias plog="tail -50 /var/log/pacman.log"
alias pinst="grep 'installed' /var/log/pacman.log | tail -20"
alias pupg="grep 'upgraded' /var/log/pacman.log | tail -20"
alias pexp='pacman -Qe'
alias pinfo='pacman -Qi '
alias pgrp='pacman -Qg '
alias pmirror='sudo reflector --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'
alias fix-keys='sudo pacman-key --init && sudo pacman-key --populate'
alias cleanup='sudo pacman -Sc && sudo journalctl --vacuum-time=2weeks'

# Paru/Yay stuff
alias pget='paru -S '
alias yget='yay -S '
alias yrem='yay -R '
alias prem='paru -R '

#Bash aliases
alias mkfile='touch'
alias jctl='journalctl -p 3 -xb'
alias breload='cd ~ && source ~/.bashrc'
alias zreload='cd ~ && source ~/.zshrc'
alias pingme='ping -c64 github.com'
alias cls='clear && fastfetch'
alias traceme='traceroute github.com'
alias jf='journalctl -f'
alias jerr='journalctl -p err -b'
alias reload='source ~/.bashrc'
alias pingg='ping -c 5 8.8.8.8'
alias h='history'
alias hg='history | grep '
alias hlast='history | tail -20'
alias e='$EDITOR '

#hardware info --short
alias hw='hwinfo --short'
alias temp='sensors'
alias wtf='dmesg | tail -20'
alias battery='upower -i $(upower -e | grep BAT) | grep percentage'

## HBlock
alias block="sudo hblock"
alias unhblock="hblock -S none -D none"

#Fixes & Tools
alias rpower='sudo systemctl restart power-profiles-daemon'
alias rshell='systemctl --user restart plasma-plasmashell.service'
alias reload-font='fc-cache -fv'
alias xdg-fix='xdg-user-dirs-update'

#youtube-dl
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#GiT  command
alias gcl='git clone '
alias gpl='git pull'
alias gst='git status'
alias gad='git add .'
alias gcm='git commit -m '
alias gps='git push'
alias glo='git log --oneline --graph'
alias gdf='git diff'
alias gbr='git branch'
alias gco='git checkout '
alias grst='git restore '
alias gstash='git stash'
alias gfetch='git fetch'
alias gmerge='git merge '
alias grebase='git rebase '
alias gtag='git tag'
alias gclean='git clean -fd'
alias gundo='git reset HEAD~1'
alias gwip='git commit -am "WIP"'
alias glast='git log -1 HEAD'
alias gremote='git remote -v'
alias gpull='git pull --rebase'

#Copy/Remove files/dirs
alias rm='rm -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scpd='sudo cp -R'
alias duh='du -h --max-depth=1 | sort -h'
alias fhere='find . -name '
alias perms='stat -c "%a %n" '
alias own='stat -c "%U:%G %n" '
alias biggest='find . -type f -printf "%s %p\n" | sort -rn | head -20'
alias etree='eza --tree '
alias count='command ls -1 | wc -l'
alias mkscript='install -m 755 /dev/null '

#Disk / Storage
alias disk='df -h | grep -v tmpfs'
alias inode='df -i'
alias disks='lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE'
alias mnt='mount | column -t'

#Process Management
alias psa='ps auxf'
alias psg='ps aux | grep '
alias psmem='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3 | head -10'
alias kill9='kill -9 '
alias killall9='killall -9 '

#nano
alias nz='nano ~/.zshrc'
alias nbashrc='nano ~/.bashrc'
alias nzshrc='nano ~/.zshrc'
alias pconf='sudo nano /etc/pacman.conf'
alias mkpkg='sudo nano /etc/makepkg.conf'
alias ngrub='sudo nano /etc/default/grub'
alias smbconf='sudo nano /etc/samba/smb.conf'
alias nmirrorlist='sudo nano /etc/pacman.d/mirrorlist'

#cd/ aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bk='cd -'
alias music='cd ~/Music'
alias vids='cd ~/Videos'
alias conf='cd ~/.config'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'

#verify signature for isos
alias gpg-check='gpg2 --keyserver-options auto-key-retrieve --verify'

#receive the key of a developer
alias gpg-retrieve='gpg2 --keyserver-options auto-key-retrieve --receive-keys'

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Package Info
alias info='sudo pacman -Si '
alias infox='sudo pacman -Sii '

##Refresh Keys
alias rkeys='sudo pacman-key --refresh-keys'

#shutdown or reboot
alias sr='sudo reboot'
alias ssn='sudo shutdown now'
alias su='sudo -i'

#System Info
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias today='date +"%Y-%m-%d"'
alias week='date +%V'
alias cal3='cal -3'
alias utc='date -u'
alias tz='timedatectl'
alias myip='curl ifconfig.me'
alias localip="ip a | grep 'inet ' | awk '{print \$2}'"
alias ports='ss -tulanp'
alias meminfo='command free -h'
alias cpuinfo='lscpu'
alias bc='bc -l'

#SystemD
alias se='sudo systemctl enable '
alias sd='sudo systemctl disable '
alias sstart='sudo systemctl start '
alias sq='sudo systemctl stop '
alias srs='sudo systemctl restart '
alias sstatus='sudo systemctl status '
alias sdr='sudo systemctl daemon-reload'
alias uctl='systemctl --user '
alias sctl='sudo systemctl'
alias watch='watch -n 1 '
alias jsize='journalctl --disk-usage'
alias failed='systemctl --failed'
alias boot-log='journalctl -b'
alias kern-log='journalctl -k'
alias lastboot='last reboot | head -5'
alias uptime2='uptime -p'
alias klog='journalctl --user -u plasma-plasmashell -f'

#Networking
alias dns='cat /etc/resolv.conf'
alias pubkey='cat ~/.ssh/id_ed25519.pub'
alias ip='ip --color=auto'
alias tracert='traceroute '
alias ufw-status='sudo ufw status verbose'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias wifi='nmcli dev wifi'
alias wifion='nmcli radio wifi on'
alias wifioff='nmcli radio wifi off'
alias connections='ss -tp'
alias open-ports='ss -tuln'
alias dmesg='dmesg --color=always | less -R'
alias grep-ip="grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"

#SSH
alias sshkey='ssh-keygen -t ed25519 -C '
alias sshcp='ssh-copy-id '
alias known='nano ~/.ssh/known_hosts'
alias sshconf='nano ~/.ssh/config'

#Clipboard
alias copy='wl-copy'
alias paste='wl-paste'

#Archives
alias mktar='tar -czf '
alias untar='tar -xzf '
alias mkzip='zip -r '
alias lstar='tar -tzf '

#Text / Search
alias gg='grep -r '
alias gi='grep -ri '
alias wcl='wc -l'
alias hd='hexdump -C '

#Python / Dev
alias py='python3 '
alias pip='pip3 '
alias venv='python3 -m venv '
alias serve='python3 -m http.server 8080'
alias json='python3 -m json.tool'

#Flatpak
alias fls='flatpak list'
alias fup='flatpak update'
alias frm='flatpak uninstall '
alias fsearch='flatpak search '
alias fperm='flatpak info --show-permissions '

#Permissions
alias chx='chmod +x '
alias c755='chmod 755 '
alias c644='chmod 644 '
alias c700='chmod 700 '
alias own-me='sudo chown $USER:$USER '
alias perm-fix='sudo chmod -R u+rw '

#Cleanup
alias cleantmp='sudo rm -rf /tmp/*'
alias cleantrash='rm -rf ~/.local/share/Trash/*'
alias clcache='rm -rf ~/.cache/*'
alias nohist='unset HISTFILE'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo ''$1' cannot be extracted via ex()' ;;
    esac
  else
    echo ''$1' is not a valid file'
  fi
}
