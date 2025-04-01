# Auto suggestions
install the plugin via https://github.com/zsh-users/zsh-autosuggestions

or via brew install zsh-autosuggestions

# Then run this to enable autosuggest for zsh
source {where-you-downloaded-zsh-autosuggestions}/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 

# Or this if you install via brew
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# Starship
```bash
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
```
