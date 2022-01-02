#!/bin/sh
echo 'Hello! from initialize.sh'
cd ../
ROOT=`pwd`
cd Dotfiles

rm /etc/wsl.conf
touch /etc/wsl.conf
echo [interop] >> /etc/wsl.conf
echo appendWindowsPath = false >> /etc/wsl.conf

apt update
apt upgrade -y
apt install language-pack-ja -y
update-locale LANG=ja_JP.UTF8

apt install -y \
  apt-transport-https \
	automake \
	bison \
	build-essential \
  ca-certificates \
	curl \
  gnupg-agent \
	libevent-dev \
	libncurses5-dev \
  software-properties-common \
	tree \
	pkg-config \
	xz-utils \
	zsh

#---------------------------------------------------#
# set TMUX                                          #
#---------------------------------------------------#
git clone https://github.com/tmux/tmux /usr/local/src/tmux
cd /usr/local/src/tmux
./autogen.sh
./configure --prefix=/usr/local
make
make install

#---------------------------------------------------#
# Clean setting files                               #
#---------------------------------------------------#
echo 'start: Clean setting files'
cd $ROOT/Dotfiles
pwd
rm -rf $ROOT/.vim
rm $ROOT/.viminfo
rm $ROOT/.vimrc
echo 'complete: Clean setting files'

#---------------------------------------------------#
# set Symbolic Links                                #
#---------------------------------------------------#
echo 'start: setup Symbolic Links'
ln -s $ROOT/Dotfiles/.zshrc $ROOT/.zshrc
ln -s $ROOT/Dotfiles/.vim $ROOT/.vim
ln -s $ROOT/Dotfiles/.viminfo $ROOT/.viminfo
ln -s $ROOT/Dotfiles/.vimrc $ROOT/.vimrc
ln -s $ROOT/Dotfiles/.tmux.conf $ROOT/.tmux.conf
ln -s $ROOT/Dotfiles/.tigrc $ROOT/.tigrc

#---------------------------------------------------#
# set anyenv                                        #
#---------------------------------------------------#
git clone https://github.com/anyenv/anyenv $ROOT/.anyenv
echo '########################################' >> $ROOT/.zshrc
echo '# anyenv' >> $ROOT/.zshrc
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> $ROOT/.zshrc

#---------------------------------------------------#
# set docker                                        #
#---------------------------------------------------#
apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt update
apt install -y docker-ce docker-ce-cli containerd.io

#---------------------------------------------------#
# set docker-compose                                #
#---------------------------------------------------#
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#---------------------------------------------------#
# add .zshrc                                        #
#---------------------------------------------------#
echo 'Setting finished!'
echo 'add alias to .zshrc: alias t='tmux''
echo 'add settings for fzf to .zshrc: setting for fzf'
echo 'restart terminal'
echo 'anyenv init'
