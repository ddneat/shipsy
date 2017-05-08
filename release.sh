#!/bin/sh

ERROR_CATEGORY="Expected categroy <major|minor|patch> passed as first argument";
ERROR_CURRENT="Expected current semver <X.Y.Z> passed as second argument";

CATEGORY=${1:?$ERROR_CATEGORY};
CURRENT=${2:?$ERROR_CURRENT};

function next() {
  if [ $1 == "patch" ]
  then
    echo "1.2.1";
  elif [ $1 == "minor" ]
  then
    echo "1.3.0";
  elif [ $1 == "major" ]
  then
    echo "2.2.0";
  fi
}

if `echo $1 | egrep -q '^(major|minor|patch)$'` 
then
  echo "Preparing $1";
else
  echo "Invalid category '$1' passed. $ERROR_CATEGORY";
  exit 1;
fi

# Check semver e.g.: 1.2.0
# Note: 1.2.0-beta is not supported
if `echo $2 | egrep -q '^((\d*\.){2}\d)$'`
then
  NEXT=`next $1 $2`;
  echo "Preparing $NEXT";
else
  echo "Invalid semver '$2' passed. $ERROR_CURRENT";
  exit 1;
fi


echo "Bumping to $CATEGORY";

# git checkout -b shipsy-$SEMVER
# npm version

# Update Changelog

# git push
# git push origin shipsy-$SEMVER

