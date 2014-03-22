#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
	SOURCE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	SOURCE="$(readlink "$SOURCE")"
	[[ $SOURCE != /* ]] && SOURCE="$SOURCE_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SOURCE_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
BUILD_DIR="${SOURCE_DIR}/build"

function clean {
	echo "Removing build directory: ${BUILD_DIR}"
	rm -rf "${BUILD_DIR}"
}

function compile {
	echo "Compiling"
	mkdir "${BUILD_DIR}"
	(cd "${BUILD_DIR}" && latex "${SOURCE_DIR}/main.tex" && latex "${SOURCE_DIR}/main.tex")
}

clean
compile