# simplified-jadwal-sholat

we crawl to an http API, then run cron every minute to check whether it's already pray time (only announce sholat during office hours, so it excludes shubh pray)


Add this entry to your crontab (using `crontab -e` command)

*/1 * * * * sh <path to script>/sholat.sh