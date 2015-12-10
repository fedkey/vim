## fedkey vim 说明

* 该项目是我自己的vim配置,可以在linux和windows上通用。<br><br>
* 配置使用Neobundle管理器，使用方法见：https://github.com/Shougo/neobundle.vim<br>

## 安装说明

* windows用户
 * 创建bundle目录，位置为： $VIM/vimfiles/bundle    （$VIM代表你的vim安装目录）<br>
 * 创建colors目录，位置为：$VIM/vimfiles/colors     如果有就不需创建,到https://github.com/altercation/solarized/tree/master/vim-colors-solarized/colors,将
 solarized.vim 放入：colors文件夹中 
* 下载：_vimrc到  $VIM 下。替换之前最好备份一下<br>
  * 需要ctags，请自行下载,地址：http://ctags.sourceforge.net/  
  * 上述步骤完成后，进入：gvim ，执行：NeoBundleInstall 即可。


* linux用户 
 * 创建bundle目录，位置为： ~/.vim/bundle<br>
 * 创建colors目录，位置为： ~/.vim/colors，到https://github.com/altercation/solarized/tree/master/vim-colors-solarized/colors,将
 solarized.vim 放入：colors文件夹中 
 * 下载文件到~/ 目录下，使用：mv _vimrc .vimrc 来修改_vimrc 。如果原来有.vimrc文件，替换掉原来的 .vimrc文件，操作之前先备份一下原来的.vimrc文件，当前想恢复的时候，可以换回来。<br>
