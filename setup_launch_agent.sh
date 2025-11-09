#!/bin/bash

PLIST_NAME="com.akshayukey.Habbit-Nested-main.plist"
PLIST_SRC="/Users/akshayukey/Downloads/🧠Vibecoding/Habbit-Nested-main/${PLIST_NAME}"
PLIST_DST="${HOME}/Library/LaunchAgents/${PLIST_NAME}"
LOG_DIR="/Users/akshayukey/Downloads/🧠Vibecoding/Habbit-Nested-main/logs"

# Create logs directory
mkdir -p "${LOG_DIR}"

# Unload the launch agent if it's already loaded
if [ -f "${PLIST_DST}" ]; then
    launchctl unload "${PLIST_DST}"
fi

# Copy the plist file
cp "${PLIST_SRC}" "${PLIST_DST}"

# Load the launch agent
launchctl load "${PLIST_DST}"

echo "Launch agent setup complete."
echo "To check the status, run: launchctl list | grep com.akshayukey.Habbit-Nested-main"
echo "To stop the agent, run: launchctl unload ${PLIST_DST}"
echo "To start the agent again, run: launchctl load ${PLIST_DST}"
echo "Logs are available in ${LOG_DIR}"
