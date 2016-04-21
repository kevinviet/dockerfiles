#!/bin/bash

sed -i "s/rlimit-nproc=3/#rlimit-nproc=3/" /etc/avahi/avahi-daemon.conf

# create some mandatory file
service dbus start
service dbus stop
dbus-daemon --system
avahi-daemon -D
homebridge
