# SetUbuntuEnv
通过脚本一次性地配置Ubuntu系统，包括：  
1.卸载非必要软件、添加源、更新和安装软件  
2.安装字体、主题、图标、自定义软件  
3.安装 dart、go、java、rust 语言环境  
4.配置 crontab、bash、vim、terminator

### install
```bash
$ chmod +x setenv.sh
$ sudo ./setenv.sh
# 此脚本运行结束后，还需要手动执行如下步骤
# 1.安装vim插件，打开 .vimrc：vi ~/.vimrc，然后输入 :PlunginInstall
# 2.安装浏览器插件，在firefox或chrome中打开https://extensions.gnome.org安装浏览器插件
#   然后再在此处搜索安装 dash to dock、 vitals、netspeed 等插件   
# 3.打开gnome-tweak-tool(优化)，在扩展里开启user themes、dash to dock 
#   重行打开gnome-tweak-tool(优化)，在外观中设置应用、图标、shell的主题。
```

### fonts/ 
此目录下保存打算安装到系统的字体，默认是文鼎简中楷PL，可以按需添加字体。

### utils/ 
此目录下保存你自己写的或需要的软件，这些软件将会安装到/usr/local/utilsbin 作为系统命令。  
此处提供了许多提升工作效率的工具软件，是我自己日常使用中收集或写的，如：  
| app       | func    |
| :-------  | :-----  |
Addmark     | 给 pdf 添加水印
Cpuhigh     | 查看cpu 消耗高的进程
Daysago     | 计算任意两个日期间的天数
Wechat      | 直接打开网页版微信
QRcode      | 将命令行参数转化为二维码
Tradition2s | 繁体字/文档转换为简体字/文档
Screen2gif  | 屏幕操作录制为gif动图
Pdfcut      | 分割pdf文档
Pdfcombiner | 合并多个pdf文档
Taxfee      | 计算五险一金及税费党费
Pinyin      | 输出汉字的拼音
PasswdMake  | 为任意账号生成高强度密码

### settings/ 
此目录下保存 crontab、bash、vim、terminator 的配置文件，其中 crontab 中将 /usr/local/utilsbin 加入了系统环境变量。

### themes/ 
此目录下保存美化系统所需的主题，默认是 Sierra-light，可按需添加主题，下载主题请到[此处](https://gnome-look.org) 。

### icons/ 
此目录下保存美化系统所需的图标，默认是 Mojave-CT-Light，可按需添加图标，下载图标请到[此处](https://gnome-look.org) 。
