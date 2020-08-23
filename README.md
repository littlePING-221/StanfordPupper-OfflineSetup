# StanfordPupper-OfflineSetup
> 包含Stanford Pupper机器狗项目离线安装所需的程序，解决国外源超时报错的问题

在根据[Pupper项目官方文档](https://pupper.readthedocs.io/en/latest/guide/software_installation.html)安装树莓派上所需的程序的时候有可能会发生意外的问题，主要原因有二：

第一个问题是树莓派的网络连接问题。经过尝试，树莓派的有线网卡`eth0`的IP地址必须按照Stanford文档中所规定的设置为`10.0.0.X`网段，否则会导致PS4手柄无法遥控机器狗（具体原因待查明）。

由于有线网被限制为只能在内网与PC端进行ssh通信，所以与Internet的连接只能通过WiFi进行。有关WiFi的设置需要修改`RPI-Setup/applience/etc/wpa_supplicant/wpa_supplicant.conf` 文件以设置要连接的WiFi名和密码。

第二个问题是，由于在国内的原因，通过树莓派直接下载GitHub上的源代码以及安装python库会经常会超时报错，所以无法直接使用[GitHub上的源码][2]进行安装。

更换国内的软件镜像源可以解决树莓派安装软件的问题，但因为`piwheel`并没有国内镜像源，所以安装python第三方库仍然会报错。

解决方案是在PC端下载所需的所有GitHub代码，以及python所需的第三方库的`whl`文件，然后复制到树莓派中进行本地安装。

我将更换镜像源、安装`whl`文件等一系列前置操作写成bash脚本，在正式安装Stanford提供的代码之前，执行`sudo bash pre-installl.sh`命令即可完成上述一系列操作。

所以给出的适合我们的软件安装方法如下：
1. 使用`Win32DiskImager`等软件将系统镜像文件`2019-09-26-raspbian-buster-lite.img`(官方推荐的版本)烧写进TF卡中。
2. 复制`RPI-Setup`文件夹中的所有文件及文件夹到TF卡中，覆盖已存在的文件（如有需要记得修改WiFi配置文件）。
3. 将TF卡插入树莓派，通电，正常启动树莓派。
4. 通过网线将PC与树莓派相连，修改PC端网卡的IP地址为`10.0.0.X`网段中的任意一个地址（注意不要与树莓派初始的`10.0.0.10`冲突）
5. 通过ssh工具与树莓派建立连接（地址为`10.0.0.10`，用户名为`pi`，密码为`raspberry`）。如使用powershell执行`ssh pi@10.0.0.10`。
6. （以下命令均在树莓派中执行）执行`sudo --set date`将树莓派系统时间修改为当前时间，格式为`月/日/年 小时:分钟`。
7. 执行`sudo bash pre-installl.sh`进行更改镜像源及前置安装
8. 执行`sudo ./install_packages.sh`根据提示修改IP地址及主机名（记住修改后的IP地址）
9. 执行`cd StanfordQuadruped`、`sudo bash install.sh`。安装完成后断电重启树莓派。
10. 执行`sudo systemctl status joystick`和`sudo systemctl status joystick`查看服务运行状况，如无报错，则安装完成。 
