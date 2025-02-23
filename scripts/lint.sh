#!/bin/bash

set -euo pipefail

# set -x  # Uncomment for debugging (prints each command before executing)

usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -h    Show this help message"
    echo "lints full project"
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

LINT_VERSION="v1.64.5"

# Check if golangci-lint is installed
if ! command -v golangci-lint &> /dev/null; then
    echo "Info: installing golangci-lint"
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin $LINT_VERSION
fi

golangci-lint run