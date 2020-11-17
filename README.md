# dotfiles
Contains all of my config files.

NOTE: this will replace existing files with a symlink. Before using this,
please make a backup of all files that will be touched.

### setup
```bash
cd /path/to/git/repos
git clone [REPO]
cd dotfiles
./setup.sh
```
NOTE: running `./setup.sh` will unlink any previously linked files that are
configured, so make sure this is what you want before running.

### management
It's simple, just two things to remember:
1. If you need to make edits, make them within this repo. All "installed" files
   will be kept up to date.
2. If you pull down changes, run the same steps in the "setup" above.

### TODOs
- split out scripts; one script for each env
- automate vim setup (install vim-plug, compile tags lib, install fzf if needed, etc)
