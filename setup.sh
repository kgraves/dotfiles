# copy all dot files into home directory
# TODO look into using symbolic links
cp .alsa.state ~
cp .bash_profile ~
cp .bashrc ~
cp .gemrc ~
cp .gitconfig ~
cp .npmrc ~
cp .profile ~
cp .tundra ~
cp .vimrc ~

# root needs to own this file
sudo cp rc.local /etc/rc.local

# since I'm running linux, I don't need mjolnir
# cp -r .mjolnir ~
