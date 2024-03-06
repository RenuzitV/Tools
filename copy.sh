LOCAL_PATH="$HOME/AppData/Local/nvim"

SOURCE_FILE="$LOCAL_PATH/init.vim"

if [ -f "$SOURCE_FILE" ]; then
    echo "Source file $SOURCE_FILE found. Copying to the current directory..."
    
    cp "$SOURCE_FILE" ./
    
    echo "'init.vim' has been copied to the current directory."
else
    echo "Source file $SOURCE_FILE not found. Please check the path and try again."
fi
