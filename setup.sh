# Destination path where the nvim directory will be copied
DEST_PATH="$HOME/AppData/Local/nvim"

# Source path of the nvim directory in the current directory
SOURCE_PATH="./nvim"

if [ -d "$SOURCE_PATH" ]; then
    echo "Source directory $SOURCE_PATH found. Copying to $DEST_PATH..."

    # remove the contents of the destination directory if it exists
    if [ -d "$DEST_PATH" ]; then
        rm -rf "$DEST_PATH"
    fi

    # Use cp with -r for recursive copy and -f to force overwrite without prompting
    cp -rf "$SOURCE_PATH" "$DEST_PATH"

    echo "'nvim' directory has been copied to $DEST_PATH."
else
    echo "Source directory $SOURCE_PATH not found. Please check the path and try again."
fi
