# 基本要求

### 配置Nginx和VeryNginx

##### 配置Nginx

安装：

    sudo apt update
    sudo apt install nginx

启动：

    sudo systemctl start nginx
    sudo systemctl status nginx

##### 配置VeryNginx

克隆VeryNginx仓库到本地：

    git clone https://github.com/alexazhou/VeryNginx.git
    cd VeryNginx

安装一些必要的工具：

    sudo apt install python
    sudo apt install libssl-dev
    sudo apt install gcc
    sudo apt install make
    sudo apt-get install zlib1g-dev

安装VeryNginx：

    sudo python install.py install

### 使用Wordpress搭建的站点对外提供访问的地址为： http://wp.sec.cuc.edu.cn

使用scp将wordpress4.7-zip传输至绑定的虚拟机，并完成解压缩：

    #宿主机
    scp wordpress-6.0.zip cuc@192.168.56.102:~/milkcandynginx/wordpress

    #虚拟机
    unzip wordpress-4.7.zip

将wordpress移至指定路径

    sudo mkdir /var/www/html/wp.sec.cuc.edu.cn
    sudo cp wordpress /var/www/html/wp.sec.cuc.edu.cn

### 使用Damn Vulnerable Web Application (DVWA)搭建的站点对外提供访问的地址为： http://dvwa.sec.cuc.edu.cn

# 安全加固要求

### 使用IP地址方式均无法访问上述任意站点，并向访客展示自定义的友好错误提示信息页面-1

### Damn Vulnerable Web Application (DVWA)只允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的友好错误提示信息页面-2

### 在不升级Wordpress版本的情况下，通过定制VeryNginx的访问控制策略规则，热修复WordPress < 4.7.1 - Username Enumeration

### 通过配置VeryNginx的Filter规则实现对Damn Vulnerable Web Application (DVWA)的SQL注入实验在低安全等级条件下进行防护

# VeryNginx配置要求

### VeryNginx的Web管理页面仅允许白名单上的访客来源IP，其他来源的IP访问均向访客展示自定义的友好错误提示信息页面-3

### 通过定制VeryNginx的访问控制策略规则实现：

##### 限制DVWA站点的单IP访问速率为每秒请求数 < 50

##### 限制Wordpress站点的单IP访问速率为每秒请求数 < 20

##### 超过访问频率限制的请求直接返回自定义错误提示信息页面-4

##### 禁止curl访问

# 参考

https://blog.csdn.net/m0_46065798/article/details/108805743

https://blog.csdn.net/LisaCpolar/article/details/123820878