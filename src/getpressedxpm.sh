#!/bin/sh
# 
#    a8             8a
#   d8'         88  `8b
#  d8'          88   `8b
# d8'           88    `8b
# 88            88     88
# 88            88     88
# Y8,           88    ,8P
#  Y8,  88,   ,d88   ,8P
#   Y8,  "Y8888P"   ,8P
#    "8             8"
#
#  COPYRIGHT 2015
#  JACK ENGQVIST JOHANSSON
# 
# in:  pixmaps/<name>.xpm
# out: pixmaps/<name>_pressed.xpm
echo ${1} | sed  -e 's/\.xpm/_pressed\.xpm/'
