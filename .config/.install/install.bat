#!/usr/bin/env bash

d=$(mktemp -d)
cd $d

wget https://github.com/sharkdp/bat/releases/download/v0.9.0/bat-v0.9.0-x86_64-unknown-linux-musl.tar.gz
tar xvzf bat-v0.9.0-x86_64-unknown-linux-musl.tar.gz
cd bat-v0.9.0-x86_64-unknown-linux-musl
install bat $HOME/opt/bin
