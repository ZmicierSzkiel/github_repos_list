#!/bin/bash

FLUTTER_PUB_SPEC="pubspec.yaml"
PRE_BUILD_SCRIPT="pre_build_script.sh"

MAX_SEARCH_DEPTH=3

# Flags
NO_GET=false
ONLY_DIR=''

while test $# -gt 0; do
  case "$1" in
    -ng | --no-get)
      NO_GET=true
      shift ;;
    -o | --only)
      shift
      ONLY_DIR="$1"
      shift;;
  *) esac
done

# run function in all dirs
# expects a function name
allDirs() {
    dirs=()
    # shellcheck disable=SC2038
    while IFS='' read -r line;
    do dirs+=("$line");
    done < <(find . -maxdepth $MAX_SEARCH_DEPTH -type f -name $FLUTTER_PUB_SPEC | xargs dirname | sort | uniq)

    for dir in "${dirs[@]}"; do
        $1 "$dir"
    done
}

runPreBuild() {
  if [ -n "$ONLY_DIR" ] && [[ "$1" != ./"$ONLY_DIR" ]]; then return
  fi

  cd "$1" || return

  if [ $NO_GET = false ]; then
    flutter clean
    flutter pub get
  fi

  if [ "$1" != . ] && [ "$(find . -type f -name $PRE_BUILD_SCRIPT)" ]; then
    # shellcheck source=/dev/null
    source $PRE_BUILD_SCRIPT
  fi

  cd - > /dev/null || return
}

time {
  allDirs "runPreBuild"

  TIMEFORMAT="Pre build made in: $(tput setaf 42)%R s$(tput sgr0)"
}

