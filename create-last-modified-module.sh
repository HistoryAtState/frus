#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# create an XQuery module
# exporting a map mapping relative file paths to their last commit date

# -----------------------------------------------------------------------------
# USAGE:
# ./create-last-modified-module.sh volumes/* bibliography/* > modules/frus.xqm

# -----------------------------------------------------------------------------
# build list of mappings

# helper function
# USAGE: join $separator $list
function join {
  local separator=$',\n'
  local first="$1"
  shift
  printf "%s" "$first" "${@/#/$separator}"
}

list=()

for file in ${@}
do
    iso=`git log -1 --format=%cd --date=iso-strict-local "$file"`
    list+=" '$file':xs:dateTime('$iso')"
done

# -----------------------------------------------------------------------------
# output module

echo 'module namespace frus-lm="http://history.state.gov/ns/site/frus/last-modified";'
echo 'declare variable $frus-lm:list := map{'; join $list; echo $'\n};'
