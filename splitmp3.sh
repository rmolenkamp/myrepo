#!/bin/bash
# Split mp3 file with ffmpeg
# Quick bit of code for next time I have to split an MP3 up.
# pull out a half hour chunk from the start of an audio file:
# ffmpeg -i your_audio_file.mp3 -acodec copy -t 00:30:00 -ss 00:00:00 half_hour_split.mp3
# split an audio file (that is just under 5 hours long) into half an hour chunks using ffmpeg, into a folder called “split”
# [rmolenkamp@ThinkpadT510 Muziek]$ cat splitmp3.sh 
#!/bin/bash
# Installeer eventueel eerst ffmpeg
# yum -y install ffmpeg
# Check eerst met ffmpeg -i <mp3 file> de lengte van het bestand en zet
# dan de variabele MAX

INPUTFILE="/run/media/rmolenkamp/66AA-29C1/audiobooks/The_Martian-Andy_Weir/The_Martian-Andy_Weir.mp3"
OUTPUTFILE=./The_Martian_part_
NUM=1
MAX=11
while( [ $NUM -lt $MAX ] )
do
	echo "Splitting hour: $NUM"
	ffmpeg -i $INPUTFILE -acodec copy -t 01:00:00 \
	-ss ${NUM}:00:00 ${OUTPUTFILE}${NUM}.mp3
	NUM=$((NUM+1))
done



