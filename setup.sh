# copy all dot files into home directory
# TODO look into using symbolic links
cp .alsa.state ~
cp .bash_profile ~
cp .bashrc ~
sudo cp rc.local /etc/rc.local
cp .gemrc ~
cp .gitconfig ~
cp .nvmrc ~
cp .profile ~
cp redshift.conf ~/.config/redshift.conf
cp .sqliterc ~/.sqliterc
cp .ssh-config ~/.ssh/config
cp .tundra ~
cp .vimrc ~
cp .zshrc ~
cp .zsh-update ~
cp .zshrc.pre-oh-my-zsh ~

# since I'm running linux, I don't need mjolnir
# cp -r .mjolnir ~
