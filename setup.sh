#!/bin/bash

PWD=`pwd`

for f in $PWD/.*.example
do
  echo "source is $f"
  FILE_NAME=`basename $f`
  FILE_NAME=$(basename $(echo $FILE_NAME | sed "s/\.example//g"))
  TARGET="$HOME/$FILE_NAME"
  echo "target is $TARGET"

  ln -sf "$f" "$TARGET"
done

DIRS=(`find $PWD -maxdepth 1 -mindepth 1 -type d`)
echo "directories are ${DIRS[@]}"

for dir in "${DIRS[@]}"
do
  DIR_NAME=`basename $dir`

  if [[ ! "$dir" =~ \.git$ ]]
  then
    echo "source is $dir"
    TARGET="$HOME/$DIR_NAME"
    echo "target is $TARGET"
    ln -sf "$dir" "$TARGET"
  fi
done
