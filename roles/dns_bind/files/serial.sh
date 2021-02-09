#!/bin/bash
#link: https://unix.stackexchange.com/questions/197988/how-to-increment-serial-number-in-bind9-dns-zone
ZONES_PATH="/var/lib/bind/zones"
DATE=$(date +%Y%m%d)
# we're searching for line containing this comment
NEEDLE="Serial"
for ZONE in $(ls -1 $ZONES_PATH) ; do
    curr=$(/bin/grep -e "${NEEDLE}$" $ZONES_PATH/${ZONE} | /bin/sed -n "s/^\s*\([0-9]*\)\s*;\s*${NEEDLE}\s*/\1/p")
    # replace if current date is shorter (possibly using different format)
    if [ ${#curr} -lt ${#DATE} ]; then
      serial="${DATE}00"
    else
      prefix=${curr::-2}
      if [ "$DATE" -eq "$prefix" ]; then # same day
        num=${curr: -2} # last two digits from serial number
        num=$((10#$num + 1)) # force decimal representation, increment
        serial="${DATE}$(printf '%02d' $num )" # format for 2 digits
      else
        serial="${DATE}00" # just update date
      fi
    fi
    /bin/sed -i -e "s/^\(\s*\)[0-9]\{0,\}\(\s*;\s*${NEEDLE}\)$/\1${serial}\2/" ${ZONES_PATH}/${ZONE}
    echo "${ZONE}: "
    grep "; ${NEEDLE}$" $ZONES_PATH/${ZONE}
done
