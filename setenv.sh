#!/bin/bash
#
# Ubuntu 环境配置及美化
#
# Shieber
# XIAOMI Wuhan
# Sat Jul 10 2021

# 1.卸载 Ubuntu 中不必要的软件并清除卸载后不需要的依赖项
sudo apt remove --purge -y totem rhythmbox empathy cheese aisleriot shotwell remmina
sudo apt remove --purge -y gnome-sudoku gnome-mahjongg gnome-mines transmission-common
sudo apt remove --purge -y deja-dup simple-scan thunderbird
sudo apt autoremove --purge -y

# 2.添加各种软件源
sudo add-apt-repository ppa:jonathonf/vim
sudo sh -c 'wget -qO- https://dl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c 'wget -qO- https://storage.flutter-io.cn/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'

# 3.更新软件以及安装部分实用工具
sudo apt update && sudo apt upgrade -y

sudo apt install -y curl wget atril axel aria2c
sudo apt install -y apt-transport-https htop terminator pass
sudo apt install -y graphviz adb scrcpy ncdu tldr
sudo apt install -y vim git opencc cloc
sudo apt install -y meld byzanz-record ffmpeg mencoder
sudo apt install -y python3-pip google-chrome-stable docker.io

pip3 install requests numpy py2pdf docx matplotlib bs4
pip3 install pandoc you-get

snap install cheat

# 4.安装自定义软件到系统
sudo mkdir -p /usr/local/utilsbin/
sudo cp utils/* /usr/local/utilsbin/

# 5.安装字体到自定义目录 myfonts/
sudo mkdir -p /usr/share/fonts/myfonts/
sudo cp fonts/* /usr/share/fonts/myfonts/

# 6.安装各种编程语言 dart go rust，c, cpp 不需安装，js、java 需自行下载安装
mkdir ~/language
mkdir ~/language/{c,cpp,dart}
mkdir ~/language/{go,java,javascript}
mkdir ~/language/{python,rust}

sudo apt install dart                                              # dart

curl https://studygolang.com/dl/golang/go1.16.5.linux-amd64.tar.gz # golang
sudo tar -C /usr/local -zxf go1.16.5.linux-amd64.tar.gz
rm go1.16.5.linux-amd64.tar.gz

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh     # rust

# 7.配置 crontab、bash、terminator、vim
sudo cp settings/crontab /etc/crontab
sudo service cron reload && sudo service cron restart

cp settings/bashrc ~/.bashrc && source ~/.bashrc

cp settings/config ~/.config/terminator/

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp settings/vimrc ~/.vimrc

# 8.系统图标美化
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions

for ARK in themes/*.tar.gz
do
    tar -zxf $ARK -C /usr/share/themes/
done

for ARK in icons/*.tar.gz
do
    tar -zxf $ARK -C /usr/share/icons/
done

# 9.提示信息：必须手动操作的步骤
echo "请打开 ~/.vimrc 输入 :PluginInstall 以安装 vim 插件"
echo "请打开 https://extensions.gnome.org/ 安装浏览器插件并搜索安装 dash to dock 等插件"
echo "请打开 gnome-tweak-tool 开启 dash to dock、uer theme 并设置程序和shell的图标及壁纸"

# 推荐通过 https://extensions.gnome.org 安装如下插件
# cpu power manager、dash to dock、NetSpeed、OpenWeather、User themes、 vitals、Syncthing
