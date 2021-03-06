#!/usr/bin/with-contenv bashio
until false; do
  cpuTempC=$(( $(cat /sys/class/thermal/thermal_zone0/temp ) / 1000  ))
  cpuTempF=$(( ( $cpuTempC *  9/5 ) + 32 ))
  echo "Current Temperature $cpuTempC"C" $cpuTempF"F
  curl -s -X POST -H "Content-Type: application/json"  -H "Authorization: Bearer $HASSIO_TOKEN" -d '{"state": "'$cpuTempC'", "attributes":  {"unit_of_measurement": "C", "icon": "mdi:clock-start", "friendly_name": "CPU Temp"}}' http://hassio/homeassistant/api/states/sensor.cpu_temp
  sleep 10;
done
