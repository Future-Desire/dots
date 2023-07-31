##### ------------------ Avery Zhou's ZSHRC for Mac OSX ------------------ ######
export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
### --------- Basic Customizations for ZSH --------- ###
# if not running interactively, don't do anything:
[[ $- != *i* ]] && return

autoload -U compinit
autoload -U colors && colors # Enable colors
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-"$ZSH_VERSION"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]i,
# confirmations, etc.) must go above this block.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export HISTFILE=~/.cache/zsh/history
export LESSHISTFILE=~/.cache/less/history
export MYVIMRC='~/.config/vim/vimrc'
export VIMINIT='source $MYVIMRC'

# change prompt:
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
zstyle ':completion:*' menu select
# Auto complete with case insenstivity:
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Auto complete with hidden files:
_comp_options+=(globdots) # Include hidden files.



### --------- Source External Plugins --------- ###
# Source custom zsh scripts for various uses, files stored at ~/.config/zsh/:
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # Fish-like fast/unobtrusive autosuggestions based on history
source ~/.config/zsh/zsh-autocomplete/zsh-autocomplete.zsh # real-time type-ahead autocompletion
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # syntax highlighting
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme # powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.config/zsh/.p10k.zsh ] && source ~/.config/zsh/.p10k.zsh
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh



### --------- Custom Commands --------- ###
# prints a swatch of all 256 colors:
colours()
{
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# move a file to a new location, leaving behind a symolic link
symmove()
{
  # 1. Grab the full path of the original file
  # 2. move the src to dst
  # 3. symlink dst (where the original file is now at) to the src (where the 
  #    file was originally from)
  src_full_path="$(realpath $1)" && mv -i $1 $2 && ln -s $2 $src_full_path 
}


# Remove python compiled byte-code and mypy/pytest cache in either the current
# directory or in a list of specified directories (including sub directories).
function pyclean() {
  find "${@:-.}" -type f -name "*.py[co]" -delete
  find "${@:-.}" -type d -name "__pycache__" -delete
  find "${@:-.}" -depth -type d -name ".mypy_cache" -exec rm -r "{}" +
  find "${@:-.}" -depth -type d -name ".pytest_cache" -exec rm -r "{}" +
}

# Add the user installed site-packages paths to PYTHONPATH, only if the
# directory exists. Also preserve the current PYTHONPATH value.
# Feel free to autorun this when .zshrc loads.
function pyuserpaths() {
  setopt localoptions extendedglob

  # Check for a non-standard install directory.
  local user_base="${PYTHONUSERBASE:-"${HOME}/.local"}"

  local python version site_pkgs
  for python in python2 python3; do
    # Check if command exists
    (( ${+commands[$python]} )) || continue

    # Get minor release version.
    # The patch version is variable length, truncate it.
    version=${(M)${"$($python -V 2>&1)":7}#[^.]##.[^.]##}

    # Add version specific path, if:
    # - it exists in the filesystem
    # - it isn't in $PYTHONPATH already.
    site_pkgs="${user_base}/lib/python${version}/site-packages"
    [[ -d "$site_pkgs" && ! "$PYTHONPATH" =~ (^|:)"$site_pkgs"(:|$) ]] || continue
    export PYTHONPATH="${site_pkgs}${PYTHONPATH+":${PYTHONPATH}"}"
  done
}

# profile a python process using py-spy (e.g. process runs slowly, want to see where it's spending time)
pytop() {
    # List all Python processes, use fzf to select one by name
    PYPID=$(ps -ux | sed '1p;/python/!d' | fzf --header-lines=1 \
        | sed 's:[[:space:]]\+:\n:g' | sed -n 2p)
    # Call the profiler
    sudo /home/simon/miniconda3/bin/py-spy top -p $PYPID
}

brew-full-uninstall(){
    brew uninstall $1
    brew autoremove
}

# Bluetooth restart on MacOS
restart-bluetooth() {
    sudo pkill bluetoothd
    # sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
    # sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
}

restart-dock() {
    rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock
}

restart-WM() {
    yabai --restart-service 
    skhd --restart-service
}

restart-nvim() {
    trash -rf ~/.local/share/nvim 
    trash -rf ~/.local/state/nvim 
    trash -rf ~/.cache/nvim 
}



### --------- Aliases --------- ###
# Applications/Program Remaps
alias rm="trash" # moves to macos trash instead of deleting
alias vim="nvim"
alias emacs="nvim"
alias md5sum="md5"
alias code="codium"
alias pathof="realpath"
alias wget=wget --hsts-file="~/.local/share/wget-hsts"
alias icat="kitty +kitten icat"

# Save typing for common commands:
alias c="codium"
alias n="nvim"
alias nv="nvim"

# Alias common mistakes:
alias sl="ls"
alias dc="cd"
alias chomod="chmod"

alias cd/="cd /"
alias cd~="cd ~"
alias cd..="cd .."
alias cd-="cd -"

# Navigational, change later
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias icloud="cd ~/iCloud/Files"

# Summarize good default flags:
alias ll="ls -lh"
alias la="ls -lha"

alias mkexe="chmod u+x"
alias symlink="ln -s"

alias mirror="wget -E -k -K -N -p -nv -P ~/Downloads"
alias mirror-spanning="wget -E -H -k -K -p -nv -P ~/Downloads"
alias mirror-all="wget -m -E -k -K -p -nv -np --html-extension -P ~/Downloads"

alias rqcpu='srun -c4 -p contrib-cpu --pty bash'
alias rqgpu='srun -p greg-gpu --pty bash'
alias rqgpu_48='srun -C 48g -p contrib-gpu --pty bash'

# Save typing for common file edits:
local main_editor="codium"
alias cs="$main_editor ~/Files/system/cheatsheet.md"
alias options="$main_editor ~/.zshrc"
alias options-zsh="$main_editor ~/.zshrc"
alias options-nvim="$main_editor ~/.config/nvim"
alias options-ssh="$main_editor ~/.ssh/config"

# Make some commands (potentially) less destructive:
alias mv="mv -i"
alias cp="cp -i"
alias mkdir="mkdir -p"
alias rmrf="rm -rfi"
alias clear="clear -x"

# Open apps/files:
alias openapp="open -n -a"
alias textedit="open -a TextEdit"
alias blender="open -n -a blender"
alias typora="open -n -a typora"
alias preview="open -n -a Preview"

# Python:
alias python="python3"
alias py3="python3"
alias py="python3"
alias pip="pip3"
alias pipin="pip3 install"
alias pipup="pip3 install pip --upgrade"
alias jl="jupyter-lab"

# Git:
alias g="git"
alias gc="git commit -m"
alias gcd="git commit -m 'debug/checkpointing'"



### --------- All the following lines were automatically appended --------- ###
