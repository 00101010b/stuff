# General Scripts and Stuff

I should probably warn you that I frequently use [Homebrew](http://brew.sh/) to install much of my coding tools, if you haven't done so, install Xcode using `xcode-select --install` to install all the development utilities and compilers before installing Homebrew. Once that is installed, follow the install instructions on the Homebrew website to install it.

Once you have Homebrew installed, run `brew doctor` and fix any issues that it mentions before continuing.

### disablebonjour-10.11.sh
__Note:__ the `disablebonjour-10.11.sh` script is not mine, it was created by: 

	JONATHAN SCHWENN @JONSCHWENN
	MAC MINI VAULT - MAC MINI COLOCATION
	MACMINIVAULT.COM - @MACMINIVAULT

I've updated it to work with 10.11.x.

Original source link: [disablebonjour.sh @ MacMiniVault on GitHub](https://github.com/MacMiniVault/Mac-Scripts/blob/master/disablebonjour/disablebonjour.sh)

### customsettings.sh
A series of custom OS X settings that I use on my personal Mac. Before using it, I recommend commenting out any settings you don't want altered as you may not like them.

Source of settings used: [Awesome OS X Commandline](https://github.com/herrbischoff/awesome-osx-command-line)

### tmux.conf
The settings I use for tmux. If you want to try them on your Mac, you will need to install tmux via homebrew like so: `brew install tmux && brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste`. You just need to rename the file to `.tmux.conf` and place it in the root of your home directory `~/`.

### vimrc
The settings I use for MacVim. MacVim is a modern fork of the Vim editor. If you want to use it you will need to, download the file to the root of your home folder `~/` and do the following in terminal:

	cd ~
	mv ~/vimrc ~/.vimrc
	mkdir -p ~/.vim/bundle ~/.vim/autoload ~/.vim/after
	ln -s ~/.vim
	ln -s ~/.vimrc ~/.vim/init.vim
	brew install macvim --HEAD \
	--with-cscope --with-lua --with-override-system-vim \
	--with-luajit --with-python
	brew install ctags

Keep in mind that I am using the `Vundle` for plugin management in MacVim (you can find it [here](https://github.com/VundleVim/Vundle.vim)), a long with several plugins. The one that may cause you the biggest issues is the `YouCompleteMe` plugin, which is fairly well documented here:

(https://github.com/Valloric/YouCompleteMe)

You can install both Vundle and YouCompleteMe like so:

	cd ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ./Vundle.vim
	git clone https://github.com/Valloric/YouCompleteMe.git
	cd YouCompleteMe
	./install.py --clang-completer

The rest of the plugins I have listed in the `vimrc` file can be installed by running the following command in neovim (`mvim` in terminal): `:PluginInstall`.

### Hack for Powerline

These are a set of fonts that have been modified to work with the `powerline-status` Vim plugin. The original source of these files (un-modified): [Hack](http://sourcefoundry.org/hack/).

Install the fonts by selecting them all in Finder and following the dialog box instructions.

### twitter-block-spammers*.py

Custom scripts I co-wrote to block spammers on twitter. Requires the "TwitterAPI" python library to be installed and valid Twitter API account access codes. Refer to the source code for details.