# symlink all dot files into appropriate directories

INSTALL_DIR="${HOME}"

# some systems I work on contain pre-made, non-symlinked files, so block if file
# already exists.
BASH_PROFILE="$INSTALL_DIR/.bash_profile"
if [[ ! -f $BASH_PROFILE ]]; then
  ln -snf $PWD/.bash_profile $BASH_PROFILE
else
  echo "skipping .bash_profile, a non-symlink already exists"
fi

BASH_RC="$INSTALL_DIR/.bashrc"
if [[ ! -f $BASH_RC ]];
then
  ln -snf $PWD/.bashrc $BASH_RC
else
  echo "skipping .bashrc, a non-symlink already exists"
fi

ln -snf $PWD/.gitconfig $INSTALL_DIR/.gitconfig
ln -snf $PWD/.gitignore_global $INSTALL_DIR/.gitignore_global
ln -snf $PWD/.sqliterc $INSTALL_DIR/.sqliterc
ln -snf $PWD/.vimrc $INSTALL_DIR/.vimrc

mkdir -p $INSTALL_DIR/.ssh
ln -snf $PWD/ssh/config $INSTALL_DIR/.ssh/config
# will inherit dir permissions, which ssh gets mad about
chmod 644 $INSTALL_DIR/.ssh/config

# TODO won't hurt anything as-is, but could be os specific
mkdir -p $INSTALL_DIR/.config
ln -snf $PWD/config/redshift.conf $INSTALL_DIR/.config/redshift.conf
ln -snf $PWD/config/nvim/ $INSTALL_DIR/.config/nvim
