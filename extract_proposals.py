#!/usr/bin/env python3

import sys

start = 3
title = 17
description = 18

if len(sys.argv) == 3:
    folder = sys.argv[2]
else:
    folder = '.'

with open(sys.argv[1]) as infile:
    # first three lines are title etc
    for _ in range(3):
        infile.readline()
    for line in infile:
        cols = line.split('\t')
        out_filename = cols[title].replace('/', '_')
        with open(f'{folder}/{out_filename}.txt', 'w') as outfile:
            outfile.write(f'{cols[title]}\n{cols[description]}\n')
