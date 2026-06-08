# sudo apt update
# sudo apt install build-essential

# Installin zsh

sudo apt update && sudo apt install zsh -y
# Set as default shell
chsh -s $(which zsh)

# Install oh my -zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting plugin
CURRENT_DIR=$(pwd)
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone https://github.com/zsh-users/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting
fi
cd "$CURRENT_DIR"

#Add github copilot - enables command ghcs and ghce
# echo 'eval "$(gh copilot alias -- zsh)"' >> ~/.zshrc

# Refresh the current terminal with the newly installed configuration
zsh ~/.zshrc

# NVM
#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash

zsh ~/.zshrc

#Node
nvm install --lts

# pnpm

npm install -g pnpm

# claude
#
curl -fsSL https://claude.ai/install.sh | bash

echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.zshrc && source ~/.zshrc

# Neovim
# git clone git@github.com:neovim/neovim.git
#  Checkout to branch which version you want
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install
#
# Starter configuration
# sudo apt install ripgrep
# git clone https://github.com/LazyVim/starter
#
# fdfind - for a Neovim plugin
# sudo apt install fd-find
# rg
# sudo apt install rg
