#!/bin/bash

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
outdir=~/android_audit_$timestamp
mkdir -p "$outdir"

adb shell getprop > "$outdir/device_properties.txt"
adb shell pm list packages -f > "$outdir/installed_packages.txt"
adb shell pm list permissions -d -g > "$outdir/permissions.txt"
adb shell service list > "$outdir/services.txt"
adb shell ps -A > "$outdir/processes.txt"
adb logcat -d > "$outdir/logcat.txt"

echo "Done. Output saved to $outdir"
