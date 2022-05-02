Kindle 越狱插件 File Browser 使用说明：

=======================================================

开始以下步骤前需确保你的 Kindle 已经成功越狱，并安装了 KUAL 插件。

1. 下载插件压缩包，解压得到 filebrowser 文件夹，将其拷贝到 Kindle 根目录下的 extensions 目录中。
2. 插件安装完成后，进入 Kindle 界面，打开 KUAL，可以在菜单中找到【File Browser】，可进行如下操作：
   -【 Start 】可开启免登录的 WEB 服务
   -【 Start (Auth) 】可开启带登录验证的 WEB 服务（默认用户名密码均为：admin）
   -【 Reset 】删除包含配置信息的数据文件 filebrowser.db。谨慎点击。
   -【 Kill 】强行中止后台的 WEB 服务（用于debug），请勿用于正常退出。谨慎点击。
3. 如果服务开启时设备 WiFi 处于关闭状态，WiFi 会被自动打开并在服务关闭后恢复原来状态。
4. 开启 WEB 服务后，可以在 Kindle 界面的顶部看到 IP 地址，在同一局域网下即可通过浏览器访问此地址。
5. 服务开启后会阻止屏幕自动关闭，请使用电源键关闭filebrowser服务，再按电源键即可正常锁屏休眠。
6. 顶部残留 IP 显示意味着服务未完全关闭，提醒用户该设备将不会熄屏和休眠。按一次电源键后 IP 会消失，否则请重启设备。

=======================================================  
可前往 https://github.com/filebrowser/filebrowser 下载linux-armv7版本的release，用以更新插件的二进制文件`extensions/filebrowser/filebrowser`  
详细说明及问题反馈：https://bookfere.com/post/823.html
