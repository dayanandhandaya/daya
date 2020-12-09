#!/bin/bash
SCORE=0
PASS=0
TOTAL_TESTS=12
redis-server --daemonize yes

echo "get id" | redis-cli > id.txt
if(($(grep -io "ODC 13" id.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get chairs" | redis-cli > chairs.txt
if(($(grep -io 130 chairs.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get monitors" | redis-cli > monitors.txt
if(($(grep -io 111 monitors.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get racks" | redis-cli > racks.txt
if(($(grep -io 111 racks.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get fans" | redis-cli > fans.txt
if(($(grep -io 2 fans.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;


echo "get keyboards" | redis-cli > keyboards.txt
if(($(grep -io 3 keyboards.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get fire_sensors" | redis-cli > sensors.txt
if(($(grep -io 50 sensors.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get led" | redis-cli > led.txt
if(($(grep -io 50 led.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get fire_exit_boards" | redis-cli > boards.txt
if(($(grep -io 2 fans.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get fire_warden" | redis-cli > fwarden.txt
if(($(grep -io "Camly" fwarden.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;

echo "get evacuation_warden" | redis-cli > ewarden.txt
if(($(grep -io "Harry" ewarden.txt | wc -l)==1)); then PASS=$((PASS+1)); fi;


if [ -f /usr/bin/redis-server ]
then PASS=$((PASS + 1))
fi;
echo ""
echo $PASS
SCORE=$(($PASS*100 / $TOTAL_TESTS))
echo "FS_SCORE:$SCORE%"