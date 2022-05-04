Kindle越狱插件FileBrowser使用说明：

=======================================================

开始以下步骤前需确保你的Kindle已经成功越狱，并安装了KUAL插件。

1. 下载插件压缩包，解压得到filebrowser文件夹，将其拷贝到Kindle根目录下的extensions目录中。
2. 插件安装完成后，进入Kindle界面，打开KUAL，可以在菜单中找到【FileBrowser】，可进行如下操作：
    * 【Start】可开启免登录的WEB服务  
    * 【Start(Auth)】可开启带登录验证的WEB服务（默认用户名密码均为：admin）  
    * 【Kill】强行中止后台的WEB服务（用于debug），勿用于正常退出。  
    * 【Reset】删除包含配置信息的数据文件filebrowser.db。谨慎点击。  

3. 如果服务开启时设备WiFi处于关闭状态，WiFi会被自动打开并在服务关闭后恢复原来状态。
4. 开启WEB服务后，可以在Kindle界面的顶部看到IP地址，在同一局域网下即可通过浏览器访问此地址。
5. 服务开启后Kindle会保持屏幕常亮且不会休眠，使用完成后请按电源键关闭本服务以恢复到正常状态，此时再按电源键即可正常锁屏休眠。
6. 如果有IP显示残留则意味着服务未正常退出，这提醒用户此时设备可能依然处在屏幕常亮状态。正常情况下按一次电源键后IP会消失，否则请尝试点击【Kill】或重启设备。相反，IP显示消失则意味着服务已经完全关闭，保证了不会有后台任务耗电。
7. 如果IP及其它提示的显示位置不居中，可以自行在电脑上修改文件`filebrowser_wrapper.sh`、`kill.sh`和`show_status.sh`开头的`col=30`。例如改为`col=20`可以使显示更靠左。

=======================================================  
* 可前往 https://github.com/filebrowser/filebrowser 下载linux-armv7版本的release，用以更新插件的二进制文件`extensions/filebrowser/filebrowser`  
* 详细说明及问题反馈：https://bookfere.com/post/823.html
