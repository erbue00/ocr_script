#!/bin/zsh

echo $1
mkdir tmp
pdfimages -all "$1" tmp/img
for file in tmp/*; do
  tesseract $file ${file:r} -l deu pdf
  rm "$file"
done

echo "====================";

cd tmp
file_array=("${(@f)$(ls -1)}")
pdfunite $file_array ../${1:t:r}_searchable.pdf
cd ..
rm -rf tmp

