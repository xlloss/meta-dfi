#!/bin/bash 

CHECK_CALI_VAL=$(cat /etc/udev/rules.d/touchscreen.rules | grep LIBINPUT_CALIBRATION_MATRIX)
if [[ ${CHECK_CALI_VAL} != "" ]];then
  sed -i '21d' /etc/udev/rules.d/touchscreen.rules
fi

# Store the transformation arguments for the resistive touchscreen as udev rule
echo 'SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", ENV{LIBINPUT_CALIBRATION_MATRIX}="'$2 $3 $4 $5 $6 $7'"' >> /etc/udev/rules.d/touchscreen.rules

