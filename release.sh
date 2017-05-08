#!/bin/sh

EXPECTED_VERSION="Expected <major|minor|patch> passed as first argument";
PASSED_VERSION=${1:?$EXPECTED_VERSION};

if `echo $1 | egrep -q '^(major|minor|patch)$'` 
then
  echo "Preparing $1";
else
  echo "Invalid version '$1' passed. $EXPECTED_VERSION";
  exit 1;
fi

echo "Bumping to $PASSED_VERSION";

# git checkout -b shipsy-$SEMVER
# npm version

# Update Changelog

# git push
# git push origin shipsy-$SEMVER

