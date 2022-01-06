#!/bin/bash

WIFI_TEST_AP_SSID=$1
WIFI_TEST_AP_PWD=$2

WPA_CONF="/etc/wpa_supplicant/wpa_supplicant-nl80211-wlan0.conf"

echo "WIFI_TEST_AP_SSID:"${WIFI_TEST_AP_SSID}
echo "WIFI_TEST_AP_PWD:"${WIFI_TEST_AP_PWD}

mkdir -p /etc/wpa_supplicant/
if [[ "${WIFI_TEST_AP_PWD}" == "" ]]; then
		echo "WIFI_TEST_AP_PWD empy"
		wpa_passphrase ${WIFI_TEST_AP_SSID} "fakepassword" > ${WPA_CONF}
		sed -i 3d ${WPA_CONF}
		sed -i 3d ${WPA_CONF}
		sed -i '3 i \    \key_mgmt=NONE' ${WPA_CONF}
else
		wpa_passphrase ${WIFI_TEST_AP_SSID} ${WIFI_TEST_AP_PWD} > ${WPA_CONF}
fi
