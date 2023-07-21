#!/bin/bash

if [ ! -d "$HOME/bin/node_modules/http-server" ]; then
	pushd "$HOME/bin"
	npm install http-server
	popd
fi
node "$HOME/bin/node_modules/http-server" $@
