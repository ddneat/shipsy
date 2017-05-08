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

VERSION_ERROR="Expected categroy <major|minor|patch> passed as first argument";

test "sh release.sh" "throws when no argument is passed" "$VERSION_ERROR";
test "sh release.sh beta" "throws when invalid semver is passed" "Invalid category 'beta' passed. $VERSION_ERROR";
test "sh release.sh major" "logs major semver" "Preparing major";
test "sh release.sh minor" "logs minor semver" "Preparing minor";
test "sh release.sh patch" "logs minor patch" "Preparing patch";
test "sh release.sh major" "logs bumping major" "Bumping to major";
test "sh release.sh minor" "logs bumping minor" "Bumping to minor";
test "sh release.sh patch" "logs bumping patch" "Bumping to patch";
