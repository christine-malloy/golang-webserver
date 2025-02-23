#!/bin/bash

set -euo pipefail

# set -x  # Uncomment for debugging (prints each command before executing)

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h    Show this help message"
    echo "compiles the binary in the bin directory and installs the packages"
    exit 0
}

# Parse command-line arguments
while getopts ":h" opt; do
    case ${opt} in
        h )
            usage
            ;;
        \? )
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
    esac
done

# Set GOBIN if it's not already set, using $HOME/bin as the default
if [ -z "$(go env GOBIN)" ]; then
  echo "Setting GOBIN to $HOME/bin"
  go env -w GOBIN=$HOME/bin
fi

# export bin to path
export PATH=$PATH:$(go env GOBIN)

go install ./...