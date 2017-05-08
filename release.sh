#!/bin/sh

ERROR_CATEGORY="Expected categroy <major|minor|patch> passed as first argument";
ERROR_CURRENT="Expected current semver <X.Y.Z> passed as second argument";

CATEGORY=${1:?$ERROR_CATEGORY};
CURRENT=${1:?$ERROR_CURRENT};

if `echo $1 | egrep -q '^(major|minor|patch)$'` 
then
  echo "Preparing $1";
else
  echo "Invalid category '$1' passed. $ERROR_CATEGORY";
  exit 1;
fi

echo "Bumping to $CATEGORY";

# git checkout -b shipsy-$SEMVER
# npm version

# Update Changelog

# git push
# git push origin shipsy-$SEMVER

