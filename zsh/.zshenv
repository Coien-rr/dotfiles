export RUSTUP_DIST_SERVER="https://rsproxy.cn" 
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export PATH=$PATH:$(go env GOPATH)/bin

. "$HOME/.cargo/env"
