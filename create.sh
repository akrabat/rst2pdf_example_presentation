#!/bin/sh

INPUT_FILE=presentation.rst
OUTPUT_FILE=rst2pdf_example_presentation.pdf

rst2pdf $INPUT_FILE \
    -b1 \
    --fit-background-mode=scale \
    --smart-quotes=1 \
    --fit-literal-mode=overflow \
    -s borland.style,style-main.style \
    --output=$OUTPUT_FILE \
    --strip-elements-with-class=handout \
    $@

