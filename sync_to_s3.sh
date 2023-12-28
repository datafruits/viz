#!/bin/bash

PATH=ARGV[1]
aws s3 cp $PATH s3://datafruitsvizdumps
