#!/bin/sh

FILE=$1
if [ -z "$FILE" ]; then
    FILE=presentation
fi

rst2pdf ${FILE}.rst \
    -b1 \
    --fit-background-mode=scale \
    --smart-quotes=1 \
    --fit-literal-mode=overflow \
    -s borland.style,style-main.style \
    --output=${FILE}.pdf
