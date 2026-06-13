sudo apt update
sudo apt install build-essential

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
# PERONSLA REPOS

#
# git clone git@github.com:pfrang/sunchaser.git
# git clone git@github.com:pfrang/c.git
# git clone git@github.com:pfrang/uio.git
# git clone git@github.com:pfrang/games.git
# git clone git@github.com:pfrang/websocket.git
# git@github.com:pfrang/l-p_game.git
# git@github.com:pfrang/go.git
