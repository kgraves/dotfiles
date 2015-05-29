# copy all dotfiles back to repo directory
cp ~/.alsa.state .
cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.gemrc .
cp ~/.gitconfig .
cp ~/.npmrc .
cp ~/.profile .
cp ~/.tundra .
cp ~/.vimrc .

# root needs to own this file
sudo cp /etc/rc.local .
