#!/bin/sh

DEST_ROOT="$1"
YUM_OPTIONS="$2"

sudo package-cleanup $YUM_OPTIONS --oldkernels --count=1

for pkg in gcutil gsutil retry_decorator; do
  if rpm --root "$DEST_ROOT" -q $pkg; then
    sudo yum $YUM_OPTIONS erase $pkg
  fi
done

