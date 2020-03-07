#!/bin/bash

#Help
HELP="$0 File_loc TAG"
if [ $1 = "-h" ]; then
	echo $HELP
	exit
fi

#Directory Locs
LARGE_DIR="out"
MEDIU_DIR="$LARGE_DIR/medium"
SMALL_DIR="$LARGE_DIR/small"

#File locs
LARGE="$LARGE_DIR/$2.tga"
MEDIU="$MEDIU_DIR/$2.tga"
SMALL="$SMALL_DIR/$2.tga"

#Defines
SVG=".svg"
ORIG="$1"
PNG_VER="$2.png"

##CODE

#See if Directories exist, create them if they do not
if [ ! -d $LARGE_DIR ]; then
	mkdir $LARGE_DIR
fi

if [ ! -d $MEDIU_DIR ]; then
	mkdir $MEDIU_DIR
fi

if [ ! -d $SMALL_DIR ]; then
	mkdir $SMALL_DIR
fi

#Create png file to export w/magick if given .svg
if [ $SVG = ${ORIG: -4} ]; then
	inkscape $ORIG --export-png=$PNG_VER
	ORIG="$PNG_VER"
	SVG="tripwire"
fi

#Convert png to relevant .tga s
convert $ORIG -resize 82x52\^ -gravity center -crop 82x52+0+0 $LARGE
convert $ORIG -resize 41x26\^ -gravity center -crop 41x26+0+0  $MEDIU
convert $ORIG -resize 10x7\^ -gravity center -crop 10x7+0+0 $SMALL

#If it exists, remove the created PNG
if [ $SVG = "tripwire" ]; then
	rm $ORIG
fi
