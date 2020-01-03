# Antigen: https://github.com/zsh-users/antigen
ANTIGEN="$HOME/.local/bin/antigen.zsh"

# alias begin
alias c='clear'
alias pip='pip3'
alias proxy='export all_proxy=socks5://127.0.0.1:1086'
alias zvi='antigen bundle vi-mode'

alias gc='git clone'
alias gm='git commit -a -m'
alias gp='git push origin master'
alias go='git checkout'
alias gb='git branch'
alias gpl='git pull'
alias gf='git fetch'
alias gs='git stash'
alias gr='git rebase'
alias gt='git log --graph --oneline --all'

alias mkdir='mkdir -p'
alias mkidr='mkdir -p'
alias mongod='mongod -dbpath ~/Sites/db &'
alias dns8='networksetup -setdnsservers "802.11n NIC" 8.8.8.8 8.8.4.4'
alias dns='networksetup -setdnsservers "802.11n NIC" empty'
alias dns114='networksetup -setdnsservers "802.11n NIC" 114.114.114.114'
alias dnstx='networksetup -setdnsservers "802.11n NIC" 119.29.29.29'
alias sshproxy="ssh -o 'ProxyCommand=nc -X 5 -x localhost:1086 %h %p'"


export LSCOLORS=exfxcxdxbxexexxxxxxxxx #设置ls颜色 去除背景色
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PATH=/Users/yinys/Applications/mongodb-osx-x86_64-4.0.8/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/Users/yinys/Applications/tools/bin:/Users/yinys/Applications/tools:/usr/local/opt/mysql@5.5/bin:$PATH

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)


# Initialize command prompt
#export PS1="%n@%m:%~%# "

# Enable 256 color to make auto-suggestions look nice
export TERM="xterm-256color"


# Load local bash/zsh compatible settings
_INIT_SH_NOFUN=1
#[ -f "$HOME/.local/etc/init.sh" ] && source "$HOME/.local/etc/init.sh"

# exit for non-interactive shell
#[[ $- != *i* ]] && return

# WSL (aka Bash for Windows) doesn't work well with BG_NICE
#[ -d "/mnt/c" ] && [[ "$(uname -a)" == *Microsoft* ]] && unsetopt BG_NICE

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Initialize antigen
source "$ANTIGEN"


# Initialize oh-my-zsh
antigen use oh-my-zsh

# default bundles
# visit https://github.com/unixorn/awesome-zsh-plugins
antigen bundle pip
antigen bundle svn-fast-info
#antigen bundle vi-mode

antigen bundle colorize
antigen bundle github
antigen bundle python
antigen bundle rupa/z z.sh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle Vifon/deer

antigen bundle willghatch/zsh-cdr

antigen theme xxf
#syntax color definition
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

typeset -A ZSH_HIGHLIGHT_STYLES

#ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
#ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# load local config
[ -f "$HOME/.local/etc/config.zsh" ] && source "$HOME/.local/etc/config.zsh" 
[ -f "$HOME/.local/etc/local.zsh" ] && source "$HOME/.local/etc/local.zsh"

# enable syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# setup for deer
autoload -U deer
zle -N deer

# default keymap
bindkey -s '\ee' 'vim\n'
bindkey '\eh' backward-char
bindkey '\el' forward-char
bindkey '\ej' down-line-or-history
bindkey '\ek' up-line-or-history
# bindkey '\eu' undo
bindkey '\eH' backward-word
bindkey '\eL' forward-word
bindkey '\eJ' beginning-of-line
bindkey '\eK' end-of-line

bindkey -s '\eo' 'cd ..\n'
bindkey -s '\e;' 'll\n'

bindkey '\e[1;3D' backward-word
bindkey '\e[1;3C' forward-word
bindkey '\e[1;3A' beginning-of-line
bindkey '\e[1;3B' end-of-line

bindkey '\ev' deer

alias ll='ls -l'


# options
unsetopt correct_all

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY # Don't execute immediately upon history expansion.


# source function.sh if it exists
[ -f "$HOME/.local/etc/function.sh" ] && . "$HOME/.local/etc/function.sh"


# ignore complition
zstyle ':completion:*:complete:-command-:*:*' ignored-patterns '*.pdf|*.exe|*.dll'
zstyle ':completion:*:*sh:*:' tag-order files

setopt nonomatch

