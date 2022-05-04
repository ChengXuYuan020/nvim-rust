- 从大神 askfiy 在知乎上发表的[系列文章](https://www.zhihu.com/column/c_1501743718332153856)中抄的作业。
- 感谢 askfiy 的分享！使我可以逐步按需定制符合自己习惯的 Rust IDE。


操作备忘：
1. \<leader\> -- 空格
2. C -- Ctrl, A -- Alt, S -- Shift
3. \<CR\> -- 回车
4. 自动保存的触发：离开 i 模式，buffer 栏上的绿色小圆点表示文件未写入


|模式|按键|功能|
|--|--|--|
|n|\<leader\> 1|打开或关闭目录树|
|n|\<leader\> fc|回到当前所打开文件所在的目录|
|n| o     |打开目录或文件|
|n| a     |新增目录或文件|
|n| r     |重命名目录或文件|
|n| x     |剪切目录或文件|
|n| c     |复制目录或文件|
|n| d     |删除目录或文件|
|n| y     |复制目录或文件名称|
|n| Y     |复制目录或文件相对路径|
|n| gy    |复制目录或文件绝对路径|
|n| p     |粘贴目录或文件|
|n| s     |使用系统默认程序打开目录或文件|
|n| \<Tab\> |将文件添加到缓冲区，但不移动光标|
|n| \<C-v\> |垂直分屏打开文件|
|n| \<C-x\> |水平分屏打开文件|
|n| \<C-]\> |进入光标下的目录|
|n| \<C-r\> |重命名目录或文件，删除已有目录名称|
|n| \<C-q\> |关闭当前缓冲区|
|n| \<C-h\> |切换到前一个缓冲区|
|n| \<C-l\> |切换到后一个缓冲区|
|n|\<leader\>bh |关闭左侧缓冲区|
|n|\<leader\>bl|关闭右侧缓冲区|
|n| -     |返回上层目录|
|n| I     |切换隐藏文件/目录的可见性|
|n| H     |切换点文件的可见性|
|n| R     |刷新资源管理器|
|n|\<leader\> 2|打开或关闭大纲|
|n|gs|快速取反，可在/conf/swith.lua中自定义|
|n|\<leader\>hw|搜索并跳转到单词|
|n|\<leader\>hl|关搜索并跳转到行|
|n|\<leader\>hc|关搜索并跳转到字符|
|n|cs|修改包裹字符|
|n|ds|删除包裹字符|
|n|ys|增加包裹字符|
|nv|H|行首|
|nv|L|行尾|
|n|C-u|上翻12行|
|n|C-d|下翻12行|
|i|jj|退出插入模式|
|i|A-k,j,h,l|插入模式的上下左右箭头|
|i|C-j|显示函数签名|
|n|\<leader\>ca|有灯泡提示时进行操作|
|补全|C-p|上一个|
|补全|C-n|下一个|
|补全|C-k|打开或关闭补全|
|补全|\<CR\>|做出选择|
|补全|\<Tab\>|选择框外按是选择下一个，框内按是选择当前|
