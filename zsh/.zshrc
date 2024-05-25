# alias
alias vi="nvim"
alias reload="source ~/.zshrc"
alias lsl="eza -l --icons"
alias lsa="eza -l -a --icons"
alias ls="eza --icons"
alias lg="eza -lag --icons"
alias aget="aria2c"
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p $HOME/.zinit && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
	  print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
	  print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


zinit ice depth=1 atload"!source ~/.theme.zsh" lucid nocd
zinit light romkatv/powerlevel10k

# # #=== OH-MY-ZSH & PREZTO PLUGINS =======================
# zinit for \
#       OMZL::{'history','completion','git','grep','key-bindings'}.zsh
#
# zinit wait lucid for \
#       OMZP::{'extract','fzf','git','sudo'}

# Plugins
zinit ice depth=1 wait lucid
zinit light Aloxaf/fzf-tab

zinit ice depth=1 wait blockf lucid atpull"zinit creinstall -q ."
zinit light clarketm/zsh-completions

zinit ice depth=1 wait lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice depth=1 wait lucid compile"{src/*.zsh,src/strategies/*.zsh}" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice depth=1 wait lucid nocd
zinit light wfxr/forgit

zinit ice depth=1 wait"2" lucid
zinit light hlissner/zsh-autopair

zinit load atuinsh/atuin

# create tmux new session with window name
tn() {
  tmux new-session -d -s $1
  tmux rename-window -t $1:1 'dev'
  tmux a -t $1
}

# open file
fo() {
  IFS=$'\n' out=($(fzf --query="$1" --multi))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-nvim} "$file"
  fi
}

# cd directory and open file can pass word
fcd() {
  local dir
  dir=$(fd --hidden --type d "$1" . $HOME | fzf --preview 'tree -C {}' +m) && cd "$dir"
}

# cd directory and open file can pass word
co() {
  local dir
  dir=$(fd --hidden --type d "$1" . $HOME | fzf --preview 'tree -C {}' +m) && cd "$dir" && fo
}

# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  file=$(rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
  nvim $file
}

# open yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function upm () {
    sudo reflector \
        --country China \
        --protocol https \
        --latest 3 \
        --save /etc/pacman.d/mirrorlist
    echo "updated pacman.d/mirrorlist"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if [ "$TMUX" = "" ]; then tn work; fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lc/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lc/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lc/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lc/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
# export RUSTUP_DIST_SERVER="https://rsproxy.cn"
# export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

alias seeproxy="env | grep -E 'http_proxy|https_proxy'"
alias anns="cd ~/Code/ANNS"
alias cpp="cd ~/Code/cpp/"
