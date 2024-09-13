# alias
alias vi="nvim"
alias reload="source ~/.zshrc"
alias proxy="export http_proxy=http://127.0.0.1:15732;export https_proxy=http://127.0.0.1:15732;export ALL_PROXY=socks5://127.0.0.1:15732"
alias unproxy="unset http_proxy;unset https_proxy;unset ALL_PROXY"
alias net="hdu-cli net login --username 232050221 --password LC@070236 --save"
alias gcc="gcc-14"
alias g++="g++-14"
alias anns="cd ~/Code/ANNS/"
alias cpp="cd ~/Code/CPP/"


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

alias nvim="~/nvim-macos-arm64/bin/nvim"
alias nvc="rm -rf ~/.cache/nvim/"
alias c="cd ~/Code/"
alias nc="cd ~/.config/nvim/"
alias ls="exa --icons"
alias lsa="exa --icons -l --color=always -a"
alias lst="exa --icons -T"
alias lsl="exa --icons -l --color=always"
alias aget="aria2c"
alias cooper="ssh -i /Users/cooper/BT7274_Mac_mini.pem ubuntu@1.116.150.46"
alias istar="ssh -i ~/.ssh/star lc@10.4.177.199"
alias star="kitten ssh -i ~/.ssh/star lc@10.4.177.199"
alias ilab="ssh lab401@10.4.177.198"
alias tiny="kitten ssh -i ~/.ssh/tiny byte@10.4.177.78"
alias lab="kitten ssh -i ~/.ssh/lab401 lc@10.4.177.198"
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
# eval "$(zoxide init zsh)"

# #=== OH-MY-ZSH & PREZTO PLUGINS =======================
zinit for \
      OMZL::{'history','completion','git','grep','key-bindings'}.zsh

zinit wait lucid for \
      OMZP::{'extract','fzf','git','sudo'}

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

zinit load ellie/atuin

# create tmux new session with window name
tn() {
  tmux new-session -d -s $1
  tmux rename-window -t $1:1 'dev'
  tmux a -t $1
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(atuin init zsh)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/cooper/go/bin:$PATH"
# export PATH="/home/cooper/nvim-macos/bin:$PATH"

export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

export CC='/opt/homebrew/opt/llvm/bin/clang'
export CXX='/opt/homebrew/opt/llvm/bin/clang++'

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export OpenMP_ROOT=$(brew --prefix)/opt/libomp
export LDFLAGS="-L/opt/homebrew/opt/libomp/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libomp/include"

export LDFLAGS="-L/opt/homebrew/opt/openblas/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openblas/include"
