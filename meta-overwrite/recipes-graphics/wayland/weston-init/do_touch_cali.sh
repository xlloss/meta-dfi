#!/bin/bash

INPUT_DEV=$(ls /sys/bus/i2c/drivers/ili210x_i2c/2-0041/input/)
echo "INPUT_DEV"=${INPUT_DEV}

INPUT_EVENT_N=$(echo ${INPUT_DEV} | awk -F "input" '{print $2}')
echo "INPUT_EVENT_N"=${INPUT_EVENT_N}

weston-touch-calibrator  /sys/devices/platform/soc@0/30800000.bus/30a40000.i2c/i2c-2/2-0041/input/${INPUT_DEV}/event${INPUT_EVENT_N}

