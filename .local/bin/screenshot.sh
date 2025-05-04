#!/bin/bash

# Take a screenshot + copy it to clipboard
grim -g "$(slurp)" ~/downloads/screenshot.png
wl-copy < ~/downloads/screenshot.png
