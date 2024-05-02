#!/bin/sh

chmod g-w dot.*
echo -n "copy:"
for DOTFILE in dot.*
do
  DFILE=`echo $DOTFILE | sed s/dot//`
  cp $DOTFILE ~/$DFILE
  echo -n " $DFILE"
done
echo ""
