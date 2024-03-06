LOCAL_PATH="$HOME/AppData/Local"
NVIM_PATH="nvim"

FULL_PATH="$LOCAL_PATH/$NVIM_PATH"

if [ ! -d "$FULL_PATH" ]; then
	mkdir $FULL_PATH
fi

cp -rf init.vim $FULL_PATH
