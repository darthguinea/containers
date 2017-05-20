#!/bin/bash

function test_number() {
  string=$1
  case $string in
      ''|*[!0-9.]*) echo "$string - should be a number"; exit 1;;
      *) ;;
  esac
}

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
START=${1}
END=${2}
SAVE_DIR="./new"

test_number $START
test_number $END

if [ ! -d ${SAVE_DIR} ] 
then
  mkdir ${SAVE_DIR}
fi

if [ ! `which bc` ] || [ ! `which ffmpeg` ]
then
  echo "bc or ffmpeg not installed"
  exit 1
fi

for i in `find . -maxdepth 1 -iname '*.mp4'`
do
  fn=$i
  ext="${fn##*.}"
  filename="${fn%.*}"

  len=$(ffprobe -i "$i" -show_format -v quiet | sed -n 's/duration=//p')
  len_minus_end=$(echo "${len}-${END}-${START}-8" | bc)

  echo "${filename} - ${len} - ${len_minus_end}"
  ffmpeg -i ${i} -ss ${START} -t ${len_minus_end} -loglevel panic -y -acodec copy -vcodec copy ${SAVE_DIR}/$i

done

IFS=$SAVEIFS
