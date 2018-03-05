#!/usr/bin/env bash

# Example
#
# archive.sh /path/to/build_dir /path/to/artifact.tar.xz


set -e
set -x

WORK_DIR=$1
TARBALL_PATH=$2

INSTALL_DIR=_build/pru/

BUILD_OS=$(uname -s)

if [[ $BUILD_OS = "Darwin" ]]; then
    # Use GNU tar from Homebrew (brew install gnu-tar)
    TAR=gtar
else
    TAR=tar
fi


# Assemble the tarball for the toolchain
TARGET_TUPLE=priv/
TAR_PATH="${TARBALL_PATH}"
TOOLCHAIN_BASE_NAME="$(basename ${TARBALL_PATH%.*.*})/"


MIX_ENV=test PRU_CGT=/dev/null make clean
make artifact

# Copy build files
mkdir -p $WORK_DIR
cp -R $INSTALL_DIR/ $WORK_DIR/$INSTALL_DIR

# Create tarball in work dir
cd "$WORK_DIR"
pwd
ls

rm -f $TARBALL_PATH $TAR_PATH

# Create tarball
$TAR ac -C $WORK_DIR -f $TAR_PATH --transform "s,^$TARGET_TUPLE,$TOOLCHAIN_BASE_NAME," $TARGET_TUPLE

