#!/bin/sh

# echo "PARMS" "$@" 1>&2

case "$@" in

    'list -o name,usedsnap -H -p')
	cat <<EOF
bpool   0
bpool/BOOT      0
bpool/BOOT/debian       315043840
rpool   0
rpool/ROOT      0
rpool/ROOT/debian       2605903872
rpool/opt       481693696
rpool/var       0
rpool/var/cache 0
rpool/var/log   1166417920
rpool/var/spool 2964692992
EOF
    ;;

    'list -o name,used,creation -t snapshot -H -p rpool/ROOT/debian')
	cat <<EOF
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-09-0518  14385152        1596950323
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-16-0518  15986688        1597555129
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-21-0425   36737024        1597983910
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-22-0425   24379392        1598070310
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-23-0425   13271040        1598156709
rpool/ROOT/debian@zfs-auto-snap_weekly-2020-08-23-0453  12402688        1598158422
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-24-0425   25948160        1598243109
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-25-0425   19812352        1598329512
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-26-0425   19177472        1598415909
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-27-0425   14651392        1598502305
rpool/ROOT/debian@zfs-auto-snap_daily-2020-08-28-0425   1335296 1598588722
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1517  1871872 1598627826
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1617  1953792 1598631425
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1717  2965504 1598635027
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1817  3223552 1598638625
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-1917  2465792 1598642227
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-2017  389120  1598645826
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2030        290816  1598646604
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2045        405504  1598647504
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2100        917504  1598648404
rpool/ROOT/debian@zfs-auto-snap_frequent-2020-08-28-2115        0       1598649304
rpool/ROOT/debian@zfs-auto-snap_hourly-2020-08-28-2117  0       1598649426
EOF
    ;;
    
    'list -o name,used,creation -t snapshot -H -p rpool/var/cache')
	# no output
	;;

esac
