#!/bin/sh
# usage: type './update.sh'

cd vcards
grep "<vcard" *.xml > ../tmp.txt
cd ..
sed s/.*.xml:// tmp.txt > allcards.txt

rm tmp.txt

cat includes/vcards-head.txt allcards.txt includes/vcards-foot.txt > server-vcards.xml

rm allcards.txt

xsltproc xslt/vcards2disco.xsl server-vcards.xml > services.xml

xsltproc xslt/vcards2index.xsl server-vcards.xml > index.html

