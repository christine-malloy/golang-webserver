#!/bin/bash

set -euo pipefail

# set -x  # Uncomment for debugging (prints each command before executing)

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h    Show this help message"
    echo "run tests"
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

go test -v ./...