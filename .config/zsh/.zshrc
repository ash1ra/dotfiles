HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh/history"

autoload -U compinit
[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)

bindkey -v
export KEYTIMEOUT=5

eval "$(starship init zsh)"
# eval "$(zoxide init zsh)"

alias s="source .venv/bin/activate"
