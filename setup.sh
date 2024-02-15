# install lastest neovim
mv ~/.local/share/nvim ~/.local/share/nvim-bp
mv ~/.local/state/nvim/ ~/.local/state/nvim-bp
mv ~/.cache/nvim ~/.cache/nvim-bp

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir ~/.nvim
mv nvim.appimage ~/.nvim/nvim
echo "export PATH=\$PATH:~/.nvim"
echo "alias vi='nvim'" >> ~/.zshrc
echo "alias vim='nvim'" >> ~/.zshrc
source ~/.zshrc
# install riprep and fd-rd
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm -rf ripgrep_14.1.0-1_amd64.deb
sudo apt install fd-find