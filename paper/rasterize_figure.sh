#!/bin/bash
# courtesy of: https://stackoverflow.com/questions/9607687/replacing-vector-images-in-a-pdf-with-raster-images

set -e

DPI=300
INPUT_FILE=$1 ; shift
OUTPUT_FILE=$1 ; shift

gs -o /tmp/onlytxt.pdf -sDEVICE=pdfwrite -dFILTERVECTOR -dFILTERIMAGE $INPUT_FILE
gs -o /tmp/graphics.pdf -sDEVICE=pdfwrite -dFILTERTEXT $INPUT_FILE
convert -density $DPI -quality 100 /tmp/graphics.pdf /tmp/graphics.png
convert -density $DPI -quality 100 /tmp/graphics.png /tmp/graphics.pdf
pdftk /tmp/graphics.pdf stamp /tmp/onlytxt.pdf output $OUTPUT_FILE
rm /tmp/onlytxt.pdf /tmp/graphics.pdf /tmp/graphics.png

