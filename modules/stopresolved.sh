#!/bin/bash

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo rm -v /etc/resolv.conf