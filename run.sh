#!/bin/sh
i=1
for datafile in *.csv ; do
    run_name=run"$i"
    let "i=i+1"
    mkdir "$run_name"
    ./extract_proposals.py "$datafile" "$run_name"
    cd "$run_name"
    mkdir images
    for filename in *.txt ; do
	base=`basename -s .txt "$filename"`
	wordcloud_cli --text "$base".txt --width 400 --height 400 --imagefile "$base".png --background white --color red --min_word_length 2 --mask ../coronamask.png --stopwords ../stopwords --no_collocations --contour_color blue --contour_width 0.05
	mv "$base".png images
    done
    cd ..
done
