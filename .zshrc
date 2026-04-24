# My minimal zsh config - Foot/Niri optimized

# if not interactive, GTFO
[[ -t 0 && -t 1 ]] && {
  (( ${+commands[zoxide]} )) && eval "$(zoxide init zsh)"
  (( ${+commands[fzf]} )) && source <(fzf --zsh)
  eval "$(starship init zsh)"
  source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
}

HISTFILE=~/.zsh_history
HISTSIZE=100000 SAVEHIST=100000
setopt HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS INC_APPEND_HISTORY

bindkey "\\e[A" history-beginning-search-backward
bindkey "\\e[B" history-beginning-search-forward
setopt autocd

# COMPINIT FIXED - autoload FIRST
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit -C
else
  compinit
fi
fpath=(/usr/share/zsh-completions/src $fpath)

# aliases
alias ls='ls -la --color=auto'
alias cd='z'
alias push='~/scripts/git-push.zsh'
alias emacs='emacs -nw'


# export
export EDITOR="emacs -nw"
export PATH="$PATH:/home/sharingan/.local/bin:/home/sharingan/.config/emacs/bin"

# End on .zshrc
