#!/bin/bash

status=$(pgrep -x wofi)

if [[ ! $status ]]
then
    wofi
else
    kill -9 $status
fi
