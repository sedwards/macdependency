#!/bin/bash

#
# This script assumes your binary is on the Desktop and you are planning to build the DMG there.
#

APP_NAME="MacDependency"
APP_PATH="$APP_NAME.app"
DMG_NAME="$APP_NAME.dmg"
VOL_NAME="$APP_NAME Installer"
SRC_FOLDER="$HOME/source/macdependency"
TEMP_DIR="$APP_NAME-temp"  # Temporary directory for DMG contents

echo $APP_NAME
echo $APP_PATH
echo $DMG_NAME
echo $VOL_NAME
echo $SRC_FOLDER
echo $TEMP_DIR

# chnage directory
cd "$HOME/Desktop"

# Remove any existing temporary directory
rm -rf "$TEMP_DIR"

# Create new directory for temporary files
mkdir -p "$TEMP_DIR/source"
cp create_dmg_for_app.sh $TEMP_DIR/source/

# Copy Application
rsync -av --links "$APP_PATH" "$TEMP_DIR"

# Copy the source
rsync -av --links "$SRC_FOLDER" "$TEMP_DIR/source"

# Create the DMG file
hdiutil create -volname $VOL_NAME -srcfolder $TEMP_DIR -ov -format UDZO $DMG_NAME

# Clean up the temporary directory
rm -rf "$TEMP_DIR"

