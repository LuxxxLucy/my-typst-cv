#!/bin/bash
set -e

mkdir -p output

if [ "$1" = "watch" ]; then
    echo "Watching cv.typ -> output/cv.pdf (en) + output/cv-zh.pdf (zh); Ctrl-C to stop"
    typst watch cv.typ output/cv.pdf --input lang=en &
    typst watch cv.typ output/cv-zh.pdf --input lang=zh &
    trap 'kill 0' EXIT
    wait
    exit 0
fi

echo "Building CV (en)..."
typst compile cv.typ output/cv.pdf --input lang=en

echo "Building CV (zh)..."
typst compile cv.typ output/cv-zh.pdf --input lang=zh

cp index.html output/

echo "✓ output/cv.pdf, output/cv-zh.pdf, output/index.html"
