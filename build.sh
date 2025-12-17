#!/bin/bash

echo "Building CV..."
typst compile cv.typ cv.pdf
echo "✓ CV generated: cv.pdf"
