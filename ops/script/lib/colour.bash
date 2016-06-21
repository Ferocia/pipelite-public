#!/usr/bin/env bash

declare -A color_table=(
  ["red"]='\033[00;31m'
  ["green"]='\033[00;32m'
  ["yellow"]='\033[00;33m'
  ["blue"]='\033[00;34m'
  ["purple"]='\033[00;35m'
  ["cyan"]="\033[00;36m"
  ["white"]='\033[00;37m'
  ["red-bright"]='\033[01;31m'
  ["green-bright"]='\033[01;32m'
  ["yellow-bright"]='\033[01;33m'
  ["blue-bright"]='\033[01;34m'
  ["purple-bright"]='\033[01;35m'
  ["cyan-bright"]='\033[01;36m'
  ["white-bright"]='\033[01;37m'
)

color-cat() {
  declare color="$1"
  while read -r; do
    printf "${color_table[$color]}%s\033[0m\n" "$REPLY"
  done
}

color-init() {
  for color in "${!color_table[@]}"; do
    eval "$color() { color-cat $color; }"
  done
}
