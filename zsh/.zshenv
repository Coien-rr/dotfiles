export RUSTUP_DIST_SERVER="https://rsproxy.cn" 
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++

# go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

# neovim local build
export PATH="$HOME/neovim/bin:$PATH"

. "$HOME/.cargo/env"
