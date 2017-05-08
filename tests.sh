#!/bin/sh

function red() {
  echo "\x1B[31m$1\x1B[0m";
}

function green() {
  echo "\x1B[32m$1\x1B[0m";
}

function yellow() {
  echo "\x1B[33m$1\x1B[0m";
}

function blue() {
  echo "\x1B[34m$1\x1B[0m";
}

function test() {
  cmd="sh release.sh";
  result=`{ $1; } 2>&1`;
  matches=`echo $result | grep "$3" | wc -l`;
  if [ $matches -eq 0 ]
  then
    echo `red "Fail: $1 $2"`;
    echo `yellow "+ $3"`;
    echo `red "- $result"`;
    exit 1;
  fi
  message=`blue "$1 $2"`;
  echo `green "Pass: $message"`;
}

ERROR_CATEGORY="Expected categroy <major|minor|patch> passed as first argument";
ERROR_CURRENT="Expected current semver <X.Y.Z> passed as second argument";

test "sh release.sh" "throws when no argument is passed" "$ERROR_CATEGORY";
test "sh release.sh beta" "throws when only one argument is passed" "$ERROR_CURRENT";

test "sh release.sh beta 0.0.0" "throws when invalid category is passed" "Invalid category 'beta' passed. $ERROR_CATEGORY";

test "sh release.sh major 0.0.0" "logs major semver" "Preparing major";
test "sh release.sh minor 0.0.0" "logs minor semver" "Preparing minor";
test "sh release.sh patch 0.0.0" "logs minor patch" "Preparing patch";

test "sh release.sh major 0.0.0" "logs bumping major" "Bumping to major";
test "sh release.sh minor 0.0.0" "logs bumping minor" "Bumping to minor";
test "sh release.sh patch 0.0.0" "logs bumping patch" "Bumping to patch";

test "sh release.sh patch 1.2.0-beta" "throws when invalid semver is passed" "Invalid semver '1.2.0-beta' passed. $ERROR_CURRENT";

test "sh release.sh patch 1.2.0" "logs next semver" "Preparing 1.2.1";
test "sh release.sh minor 1.2.0" "logs next semver" "Preparing 1.3.0";
test "sh release.sh major 1.2.0" "logs next semver" "Preparing 2.2.0";
