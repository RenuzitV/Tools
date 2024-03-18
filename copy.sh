LOCAL_PATH="$HOME/AppData/Local/nvim"

# Specify the destination directory explicitly, including the 'nvim' directory name
DEST_PATH="./"

if [ -d "$LOCAL_PATH" ]; then
    echo "Directory $LOCAL_PATH found. Copying to the current directory..."

    # Remove the contents of the destination Directory
    rm -rf "$DEST_PATH/nvim"

    # Copy the 'nvim' directory to the destination path
    cp -rf "$LOCAL_PATH" "$DEST_PATH"

    echo "'nvim' directory has been copied to the current directory."
else
    echo "Directory $LOCAL_PATH not found. Please check the path and try again."
fi
