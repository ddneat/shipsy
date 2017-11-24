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

# echo test status
# $1: cmd, $2: message, $3: expectation $4: matches, $5: result
function message() {
  if [ $4 -eq 0 ]
  then
    echo $(red "Fail: $1 $2");
    echo $(yellow "+ $3");
    echo $(red "- $5");
    exit 1;
  fi
  text=$(blue "$1 $2");
  echo $(green "Pass: $text");
}

# test uses grep
# $1: cmd, $2: message, $3: expectation
function test() {
  result=$(eval $1 2>&1);
  matches=$(echo $result | grep "$3" | wc -l);
  message "$1" "$2" "$3" "$matches" "$result";
}

# etest uses egrep
# $1: cmd, $2: message, $3: expectation
function etest() {
  result=$(eval $1 2>&1);
  matches=$(echo $result | egrep $3 | wc -l);
  message "$1" "$2" "$3" "$matches" "$result";
}

