#!/bin/bash

echo "Removing SITE directory."
rm -rf SITE
echo "Creating new SITE directory."
mkdir SITE

echo "Building Index..."
docfx Index/docfx.json
if [ $? -ne 0 ]
then
    exit 1
fi
echo "Successfully built Index."

echo "Building Pie..."
docfx Pie/docfx.json
if [ $? -ne 0 ]
then
    exit 1
fi
echo "Successfully build Pie."

echo "Building Easel..."
docfx Easel/docfx.json
if [ $? -ne 0 ]
then
    exit 1
fi
echo "Successfully built Easel..."

echo "Done."
