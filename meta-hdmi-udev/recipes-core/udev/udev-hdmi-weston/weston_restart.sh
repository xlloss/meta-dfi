#!/bin/bash

EDID=$(cat /sys/class/drm/card0-HDMI-A-1/edid | hexdump | grep "ff00 ffff ffff 00ff")

touch /tmp/check_count
CHK_CNT=$(cat /tmp/check_count)
if [[ ${CHK_CNT} == "" ]];then
  CHK_CNT=1
  echo -e ${CHK_CNT} > /tmp/check_count
  exit
fi

let CHK_CNT=CHK_CNT+1
echo -e ${CHK_CNT} > /tmp/check_count

HDMI_STATUS=$(cat /sys/class/drm/card0-HDMI-A-1/enabled)
VIDEO_MODE=$(cat /sys/class/drm/card0-LVDS-1/modes)

if [[ ${HDMI_STATUS} == "disabled" ]]; then
  if [[ ${VIDEO_MODE} == "1920x1080" ]]; then
    touch /tmp/1920X1080_WESTON_RESTART
    systemctl restart weston@root.service
    exit;
  fi

  if [[ ${CHK_CNT} == 5 ]];then
    touch /tmp/1024X600_WESTON_RESTART
    systemctl restart weston@root.service
    rm /tmp/check_count
  fi
fi


if [[ ${HDMI_STATUS} == "enabled" ]]; then
  if [[ ${CHK_CNT} -gt 3 ]];then
    rm /tmp/check_count
  fi
fi
