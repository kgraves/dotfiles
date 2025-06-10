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

ZSH_RC="$INSTALL_DIR/.zshrc"
if [[ ! -f $ZSH_RC ]];
then
  ln -snf $PWD/.zshrc $ZSH_RC
else
  echo "skipping .zshrc, a non-symlink already exists"
fi

ZPROFILE="$INSTALL_DIR/.zprofile"
if [[ ! -f $ZPROFILE ]];
then
  ln -snf $PWD/.zprofile $ZPROFILE
else
  echo "skipping .zprofile, a non-symlink already exists"
fi

# source these from existing or own .bashrc
ln -snf $PWD/.bashrc.personal $INSTALL_DIR/.bashrc.personal
ln -snf $PWD/.bashrc.work.dev $INSTALL_DIR/.bashrc.work.dev

ln -snf $PWD/.gitconfig $INSTALL_DIR/.gitconfig
ln -snf $PWD/.gitignore_global $INSTALL_DIR/.gitignore_global
ln -snf $PWD/.sqliterc $INSTALL_DIR/.sqliterc
ln -snf $PWD/.vimrc $INSTALL_DIR/.vimrc
ln -snf $PWD/.pryrc $INSTALL_DIR/.pryrc
ln -snf $PWD/.pdbrc $INSTALL_DIR/.pdbrc

# TODO this is only needed on my host machine, but other stuff for my dev env.
#      I'm thinking about splitting this out into different scripts for different envs.
mkdir -p $INSTALL_DIR/.ssh
ln -snf $PWD/ssh/config $INSTALL_DIR/.ssh/config
# # will inherit dir permissions, which ssh gets mad about
chmod 644 $INSTALL_DIR/.ssh/config

# TODO won't hurt anything as-is, but could be os specific
mkdir -p $INSTALL_DIR/.config/nvim
# ln -snf $PWD/config/redshift.conf $INSTALL_DIR/.config/redshift.conf
ln -snf $PWD/config/nvim/init.vim $INSTALL_DIR/.config/nvim/init.vim

# mkdir -p $INSTALL_DIR/.config/pip
# ln -snf $PWD/config/pip.conf $INSTALL_DIR/.config/pip/pip.conf

mkdir -p $INSTALL_DIR/.ctags.d
ln -snf $PWD/.ctags.d/exclusions.ctags $INSTALL_DIR/.ctags.d/exclusions.ctags
