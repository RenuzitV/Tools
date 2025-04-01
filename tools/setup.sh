brew install starship

echo """
# auto suggestions
source ~/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 

# starship
eval "$(starship init zsh)"
""" > ~/.zshrc

source ~/.zshrc
