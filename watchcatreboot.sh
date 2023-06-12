#!/bin/sh
logread | grep watchcat > /etc/watchcatlog && reboot
