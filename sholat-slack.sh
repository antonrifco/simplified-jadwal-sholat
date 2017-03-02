#!/bin/bash

a=`curl http://muslimsalat.com/kebonjeruk.json`

sleep 1
echo "---------------------------------------" >> ~/bots/jadwalsholat/schedule.log
m=`echo $a | jq .items[0].maghrib| sed s/\"//g | sed 's. ..g'`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P" --date '+15 min' | sed 's. ..g'`

if [ "$m" = "$now" ]; then
    curl -d '{"text": "<!here|bos2semua> Halo, 15 menit lagi magrib. Ayo siap2 ke Masjid"}' https://hooks.slack.com/services/xxxxxx/xxxxxx/xxxxxxxx
    echo "sending magrib" >> ~/bots/jadwalsholat/schedule.log
else
    echo "not sending magrib ("$m" != *"$now")" >> ~/bots/jadwalsholat/schedule.log
fi

i=`echo $a | jq .items[0].isha| sed s/\"//g | sed 's. ..g'`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P" --date '+15 min' | sed 's. ..g'`

if [ "$i" = "$now" ]; then
    curl -d '{"text": "<!here|bos2semua> Halo, 15 menit lagi isya. Ayo siap2 ke Masjid"}' https://hooks.slack.com/services/xxxxxx/xxxxxx/xxxxxxxx
    echo "sending isyak" >> ~/bots/jadwalsholat/schedule.log
else
    echo "not sending isyak ("$i" != *"$now")" >> ~/bots/jadwalsholat/schedule.log
fi

ash=`echo $a | jq .items[0].asr| sed s/\"//g | sed 's. ..g'`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P" --date '+15 min' | sed 's. ..g'`

if [ "$ash" = "$now" ]; then
    curl -d '{"text": "<!here|bos2semua> Halo, 15 menit lagi ashar. Ayo siap2 ke Masjid"}' https://hooks.slack.com/services/xxxxxx/xxxxxx/xxxxxxxx
    echo "sending ashar">> ~/bots/jadwalsholat/schedule.log
else
    echo "not sending ashar ("$ash" != *"$now")" >> ~/bots/jadwalsholat/schedule.log
fi

dhuhr=`echo $a | jq .items[0].dhuhr| sed s/\"//g | sed 's. ..g'`
now=`TZ=":Asia/Jakarta" date +"%l:%M %P" --date '+15 min' | sed 's. ..g'`

if [ "$dhuhr" = "$now" ]; then
    curl -d '{"text": "<!here|bos2semua> Halo, 15 menit lagi dhuhr. Ayo siap2 ke Masjid"}' https://hooks.slack.com/services/xxxxxx/xxxxxx/xxxxxxxx
    echo "sending dhuhr"> ~/bots/jadwalsholat/schedule.log
else
    echo "not sending dhuhr ("$dhuhr" != *"$now")" >> ~/bots/jadwalsholat/schedule.log
fi
