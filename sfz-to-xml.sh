#!/bin/bash

# Usage: File
# ./sfz-to-xml.sh ./Programs/01-green_keyswitch.sfz
#
# Usage: Folder
# ./sfz-to-xml.sh ./Programs


if [ ! -f sfizz_preprocessor ]
then
  curl -LO https://github.com/studiorack/sfizz/releases/download/v1.1.1/sfizz-preprocessor-mac.zip
  unzip sfizz-preprocessor-mac.zip
  rm sfizz-preprocessor-mac.zip
fi

IFS=$'\n'

if [[ $1 == *.sfz ]]
then
  # Convert file.
  ./sfizz_preprocessor "$1" --mode=xml > "${1%.*}.xml"
else
  # Convert folder.
  for file in $(find "$1" -type f -name '*.sfz')
    do ./sfizz_preprocessor "$file" --mode=xml > "${file%.*}.xml"
  done
fi
