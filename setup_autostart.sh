#!/bin/bash

# Define the plist path
PLIST_DIR="$HOME/Library/LaunchAgents"
PLIST_FILE="$PLIST_DIR/com.gemini.habbitnested.plist"

# Ensure the LaunchAgents directory exists
mkdir -p "$PLIST_DIR"

# Unload any existing version of the service to ensure a clean start
if [ -f "$PLIST_FILE" ]; then
    launchctl unload "$PLIST_FILE"
fi

# Create the plist file
cat << 'EOF' > "$PLIST_FILE"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.gemini.habbitnested</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/env</string>
        <string>npm</string>
        <string>run</string>
        <string>dev</string>
    </array>
    <key>WorkingDirectory</key>
    <string>/Users/akshayukey/Downloads/🧠Vibecoding/Habbit-Nested-main</string>
    <key>RunAtLoad</key>
    <true/>
    <key>StandardOutPath</key>
    <string>/tmp/com.gemini.habbitnested.out.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/com.gemini.habbitnested.err.log</string>
</dict>
</plist>
EOF

# Load the launch agent
launchctl load "$PLIST_FILE"

echo "✅ Autostart has been set up successfully!"
echo "The application will now start automatically when you log in."
