#!/bin/sh
# in:  pixmaps/<name>.xpm
# out: pixmaps/<name>_pressed.xpm
echo ${1} | sed  -e 's/\.xpm/_pressed\.xpm/'
