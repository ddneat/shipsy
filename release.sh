#!/bin/sh

ERROR_CATEGORY="Expected categroy <major|minor|patch> passed as first argument";
ERROR_CURRENT="Expected current semver <X.Y.Z> passed as second argument";

CATEGORY=${1:?$ERROR_CATEGORY};
CURRENT=${2:?$ERROR_CURRENT};

function next() {
  patch=`echo $2 | egrep -o "\d*$"`
  minor=`echo $2 | egrep -o "\.\d+\." | tr -d "\."`
  major=`echo $2 | egrep -o "^\d+"`

  if [ $1 == "patch"  ]
  then
    patch=`expr $patch + 1`
  elif [ $1 == "minor" ]
  then
    minor=`expr $minor + 1`
  elif [ $1 == "major" ]
  then
    major=`expr $major + 1`
  fi

  echo "$major.$minor.$patch"
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

