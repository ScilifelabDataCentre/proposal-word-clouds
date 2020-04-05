#!/bin/sh
cd summary_text
for filename in *.txt ; do
    base=`basename -s .txt "$filename"`
    wordcloud_cli --text "$base".txt --width 400 --height 400 --imagefile ../summary_images/"$base".png --background white --color red --min_word_length 2 --mask ../coronamask.png --stopwords ../stopwords
done
cd ..
