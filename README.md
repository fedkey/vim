##注意：此为Gvim配置,可以在windows和linux下运行。

* 该项目是我自己的vim配置,可以在linux和windows上通用。<br><br>
* 使用Neobundle来管理所有的插件包,利于后期更改，使用方法见：https://github.com/Shougo/neobundle.vim<br>


## 支持语言
* web
 * web编程,提供html,css,js语法速写，格式化等插件。
 * 提供python django编写支持
 <br>
* python编程
 * python，我本身也常写python，所以python的支持是比较好的，代码补全，折叠，错误检查，应有都有
 * 提供python一键运行

## 其他
* 按照emacs快捷键的双键模式定义的一整套快捷键，用过emacs的人可以快速上手。当然，没有使用过emacs的人不用管，放着无害，永远不会触发。

## 安装说明

* windows用户
* git clone https://github.com/fedkey/vim.git
* 找到下载的文件夹,复制_vimrc到  $VIM 下。替换之前最好备份一下<br>
 * 创建bundle目录，位置为： $VIM/vimfiles/bundle    （$VIM代表你的vim安装目录）<br>
 * 创建colors目录，位置为：$VIM/vimfiles/colors     如果有就不需创建,到https://github.com/altercation/solarized/tree/master/vim-colors-solarized/colors,将
 solarized.vim 放入：colors文件夹中 
  * 需要ctags，请自行下载,地址：http://ctags.sourceforge.net/  
  * 上述步骤完成后，进入：gvim ，执行：NeoBundleInstall 即可。
  * 如果不需要python支持，打开_vimrc，注释掉带python相关的语句即可。


* linux用户 
*  git clone https://github.com/fedkey/vim.git 
*  复制_vimrc文件到~/，使用：mv _vimrc .vimrc 来修改_vimrc 。如果原来有.vimrc文件，替换掉原来的 .vimrc文件，操作之前先备份一下原来的.vimrc文件，当前想恢复的时候，可以换回来。<br>
 * 创建bundle目录，位置为： ~/.vim/bundle<br>
 * 创建colors目录，位置为： ~/.vim/colors，到https://github.com/altercation/solarized/tree/master/vim-colors-solarized/colors,将
 solarized.vim 放入：colors文件夹中 
 
 * 如果不需要python支持，打开_vimrc，注释掉带python相关的语句即可。
 * _vimrc文件中有所需依赖组件的说明，也提供了安装方法，请读一下_vimrc文件。
 
## 效果
* gvim for windows [solarized light]
![image](https://github.com/fedkey/vim/blob/master/images/vim-scr.png)

* gvim for ubuntu  [solarized dark]
![image](https://github.com/fedkey/vim/blob/master/images/linux_gvim.png)
 
