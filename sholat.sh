#!/bin/bash

## change this url to your kecamatan
a=`curl http://muslimsalat.com/kebonjeruk.json`

sleep 1

m=`echo $a | jq .items[0].maghrib| sed s/\"//g`
## change this to your timezone
now=`TZ=":Asia/Jakarta" date +"%l:%M %P"`

if [ "$m" = "$now" ]; then
    curl -d '{"text": "@here bos magrib boss"}' https://hooks.slack.com/services/<xxxx>/<xxxx>/<xxxx>
    echo "run announcer for magrib"
else
    echo "not run announcer for magrib"
fi

i=`echo $a | jq .items[0].isha| sed s/\"//g`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P"`

if [ "$i" = "$now" ]; then
    curl -d '{"text": "@here bos isya boss"}' https://hooks.slack.com/services/<xxxx>/<xxxx>/<xxxx>
    echo "run announcer for isya"
else
    echo "not run announcer for isya"
fi

ash=`echo $a | jq .items[0].asr| sed s/\"//g`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P"`

if [ "$ash" = "$now" ]; then
    curl -d '{"text": "@here bos ashar boss"}' https://hooks.slack.com/services/<xxxx>/<xxxx>/<xxxx>
    echo "run announcer for ashar"
else
    echo "not run announcer for ashar"
fi

dhuhr=`echo $a | jq .items[0].dhuhr| sed s/\"//g`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P"`

if [ "$dhuhr" = "$now" ]; then
    curl -d '{"text": "@here bos dhuhr boss"}' https://hooks.slack.com/services/<xxxx>/<xxxx>/<xxxx>
    echo "run announcer for dhuhr"
else
    echo "not run announcer for dhuhr"
fi


