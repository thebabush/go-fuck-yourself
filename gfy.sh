#!/bin/bash

SCRIPT_PATH=$(dirname `which $0`)

for src in $(grep --include \*.go -lrP 'func yyerrorl')
do
  echo "GFY: $src..."
  sed -ie "/^package/r $SCRIPT_PATH/imports.go" "$src"
  sed -ri "/^func\\s*yyerrorl/r $SCRIPT_PATH/patch.go" "$src"
  #echo "== HEAD =="
  #cat "$src" | head -n 10
  #echo "== yyerrorl =="
  #cat "$src" | grep 'func yyerrorl' -A 10 -B 10
done

