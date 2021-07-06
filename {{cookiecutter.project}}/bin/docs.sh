#!/bin/bash

cd ../myDocs

echo "Regenerating the documentation"
sphinx-apidoc -f --tocfile api  -o source ../src 
sphinx-build -b html -aE -d doctrees -c source source build/html

cd ..
if [ -d 'docs' ]
then
    echo "Removing the existing docs folder"
    rm -rf docs
fi

echo "Recreating the docs folder"
cp -r myDocs/build/html docs 
touch docs/.nojekyll
cd src