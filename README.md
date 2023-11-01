# Setup for Linux
```
sudo apt install tmux
sudo apt install exa
sudo apt install zsh
chsh -s $(which zsh)
# restart session here

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zshzoo/cd-ls $ZSH_CUSTOM/plugins/cd-ls
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# in repo
cd env_customizations
cp tmux/.tmux.conf ~/.tmux.conf
cp zsh/.p10k.zsh ~/.p10k.zsh
cp zsh/.zshrc ~/.zshrc
cp -r nvim/ ~/.config/

# install tmux plugins with PREFIX + I

# nvim
sudo apt install clang
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# restart nvim
# :PackerSync

```
