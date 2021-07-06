#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#特殊标注
sh_ver="1.0.1"
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

#安装update
update(){
	if [[ "${release}" == "centos" ]]; then
		yum -y update
		timedatectl set-timezone "Asia/Shanghai"
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get update -y
		timedatectl set-timezone "Asia/Shanghai"
	elif [[ "${release}" == "debian" ]]; then
		apt-get update -y
		timedatectl set-timezone "Asia/Shanghai"
	fi
	start_menu
}

#安装curl
install_curl(){
	if [[ "${release}" == "centos" ]]; then
		yum -y update && yum -y install curl vim sudo -y
		timedatectl set-timezone "Asia/Shanghai"
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get update && apt-get install curl vim sudo -y
		timedatectl set-timezone "Asia/Shanghai"
	elif [[ "${release}" == "debian" ]]; then
		apt-get update && apt-get install curl vim sudo -y
		timedatectl set-timezone "Asia/Shanghai"
	fi
	start_menu
}

#安装ssh
install_ssh(){
	if [[ "${release}" == "centos" ]]; then
		wget -P /root/.ssh -N https://github.com/WisdomGE-cloud/update/raw/main/authorized_keys
		sed -i 's/#Port/Port/g' /etc/ssh/sshd_config
		sed -i 's/Port 22/Port 17077/g' /etc/ssh/sshd_config
		sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
		sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
		service sshd restart
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -P /root/.ssh -N https://github.com/WisdomGE-cloud/update/raw/main/authorized_keys
		sed -i 's/#Port/Port/g' /etc/ssh/sshd_config
		sed -i 's/Port 22/Port 17077/g' /etc/ssh/sshd_config
		sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
		sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
		service sshd restart
	elif [[ "${release}" == "debian" ]]; then
		wget -P /root/.ssh -N https://github.com/WisdomGE-cloud/update/raw/main/authorized_keys
		sed -i 's/#Port/Port/g' /etc/ssh/sshd_config
		sed -i 's/Port 22/Port 17077/g' /etc/ssh/sshd_config
		sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
		sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
		service sshd restart
	fi
	start_menu
}

#安装statu
install_statu(){
	if [[ "${release}" == "centos" ]]; then
	        dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
	elif [[ "${release}" == "ubuntu" ]]; then
	        sudo dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
	elif [[ "${release}" == "debian" ]]; then
	        dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
	fi
	bash status.sh c
}

#安装docker
install_docker(){
	if [[ "${release}" == "centos" ]]; then
		yum -y install sudo
		curl -fsSL https://get.docker.com | bash -s docker
		sh get-docker.sh
		sudo systemctl start docker
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get install sudo -y
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
	elif [[ "${release}" == "debian" ]]; then
		apt-get install sudo -y
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
	fi
	start_menu
}

#安装docker-compose
install_docker_compose(){
	if [[ "${release}" == "centos" ]]; then
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "ubuntu" ]]; then
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "debian" ]]; then
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	fi
	start_menu
}

#安装Statu配置&docker
install_docker_statu(){
	if [[ "${release}" == "centos" ]]; then
		yum -y install sudo
		dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get install sudo -y
		dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "debian" ]]; then
		apt-get install sudo -y
		dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
		curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	fi
	start_menu
}

#编译安装wireguard
install_wireguard(){
	if [[ "${release}" == "centos" ]]; then
		yum install -y git libmnl-dev libelf-dev linux-headers-$(uname -r) build-essential pkg-config
		git clone https://git.zx2c4.com/WireGuard
		cd WireGuard/src
		make
		make install
		cd
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get install -y git libmnl-dev libelf-dev linux-headers-$(uname -r) build-essential pkg-config
		git clone https://git.zx2c4.com/WireGuard
		cd WireGuard/src
		make
		make install
		cd
	elif [[ "${release}" == "debian" ]]; then
		apt-get install -y git libmnl-dev libelf-dev linux-headers-$(uname -r) build-essential pkg-config
		git clone https://git.zx2c4.com/WireGuard
		cd WireGuard/src
		make
		make install
		cd
	fi
}

#运行旧tcp加速
install_old_tcp(){
	if [[ "${release}" == "centos" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	elif [[ "${release}" == "debian" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	fi
}

#运行新tcp加速
install_new_tcp(){
	if [[ "${release}" == "centos" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	elif [[ "${release}" == "debian" ]]; then
		wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
	fi
}

#运行iptable端口转发
iptable(){
	if [[ "${release}" == "centos" ]]; then
		wget -qO natcfg.sh http://arloor.com/sh/iptablesUtils/natcfg.sh && bash natcfg.sh
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -qO natcfg.sh http://arloor.com/sh/iptablesUtils/natcfg.sh && bash natcfg.sh
	elif [[ "${release}" == "debian" ]]; then
		wget -qO natcfg.sh http://arloor.com/sh/iptablesUtils/natcfg.sh && bash natcfg.sh
	fi
}

#添加虚拟内存
swap(){
	if [[ "${release}" == "centos" ]]; then
		wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
	elif [[ "${release}" == "ubuntu" ]]; then
		wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
	elif [[ "${release}" == "debian" ]]; then
		wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
	fi
}

#DNS流媒体解锁服务
dns(){
	if [[ "${release}" == "centos" ]]; then
		wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh && bash dnsmasq_sniproxy.sh -f
	elif [[ "${release}" == "ubuntu" ]]; then
		wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh && bash dnsmasq_sniproxy.sh -f
	elif [[ "${release}" == "debian" ]]; then
		wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh && bash dnsmasq_sniproxy.sh -f
	fi
}

#233boy一键脚本
233boy(){
	if [[ "${release}" == "centos" ]]; then
		bash <(curl -s -L https://233blog.com/v2ray.sh)
	elif [[ "${release}" == "ubuntu" ]]; then
		bash <(curl -s -L https://233blog.com/v2ray.sh)
	elif [[ "${release}" == "debian" ]]; then
		bash <(curl -s -L https://233blog.com/v2ray.sh)
	fi
}

#soga节点对接
soga(){
	if [[ "${release}" == "centos" ]]; then
	        timedatectl set-timezone "Asia/Shanghai"
		bash <(curl -Ls https://blog.sprov.xyz/soga.sh)
	elif [[ "${release}" == "ubuntu" ]]; then
	        timedatectl set-timezone "Asia/Shanghai"
		bash <(curl -Ls https://blog.sprov.xyz/soga.sh)
	elif [[ "${release}" == "debian" ]]; then
	        timedatectl set-timezone "Asia/Shanghai"
		bash <(curl -Ls https://blog.sprov.xyz/soga.sh)
	fi
}

#v2board正式版更新
v2board(){
	if [[ "${release}" == "centos" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && sh update.sh
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	elif [[ "${release}" == "ubuntu" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && sh update.sh
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	elif [[ "${release}" == "debian" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && sh update.sh
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	fi
}


#v2board-dev更新
v2board_dev(){
	if [[ "${release}" == "centos" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && git fetch --all && git reset --hard origin/dev && git pull origin dev && php artisan v2board:update
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	elif [[ "${release}" == "ubuntu" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && git fetch --all && git reset --hard origin/dev && git pull origin dev && php artisan v2board:update
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	elif [[ "${release}" == "debian" ]]; then
		cd /www/wwwroot/wisdomcloud.ml && git fetch --all && git reset --hard origin/dev && git pull origin dev && php artisan v2board:update
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
	fi
}

#soga-docker更新
soga_update(){
	if [[ "${release}" == "centos" ]]; then
		docker-compose pull
		docker-compose down
		docker-compose up -d
	elif [[ "${release}" == "ubuntu" ]]; then
		docker-compose pull
		docker-compose down
		docker-compose up -d
	elif [[ "${release}" == "debian" ]]; then
		docker-compose pull
		docker-compose down
		docker-compose up -d
	fi
}

#Netflix检测
nf(){
	if [[ "${release}" == "centos" ]]; then
		bash <(curl -sSL "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/nf.sh")
	elif [[ "${release}" == "ubuntu" ]]; then
		bash <(curl -sSL "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/nf.sh")
	elif [[ "${release}" == "debian" ]]; then
		bash <(curl -sSL "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/nf.sh")
	fi
}

#测速
speed(){
	if [[ "${release}" == "centos" ]]; then
		wget -qO- git.io/superbench.sh | bash
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -qO- git.io/superbench.sh | bash
	elif [[ "${release}" == "debian" ]]; then
		wget -qO- git.io/superbench.sh | bash
	fi
}

#路由测试
route(){
	if [[ "${release}" == "centos" ]]; then
		wget -qO- https://raw.githubusercontent.com/wn789/VPS-/master/autoBestTrace.sh | bash
	elif [[ "${release}" == "ubuntu" ]]; then
		wget -qO- https://raw.githubusercontent.com/wn789/VPS-/master/autoBestTrace.sh | bash
	elif [[ "${release}" == "debian" ]]; then
		wget -qO- https://raw.githubusercontent.com/wn789/VPS-/master/autoBestTrace.sh | bash
	fi
}

#warp网络增加
warp(){
	if [[ "${release}" == "centos" ]]; then
		bash <(curl -fsSL git.io/warp.sh) menu
	elif [[ "${release}" == "ubuntu" ]]; then
		bash <(curl -fsSL git.io/warp.sh) menu
	elif [[ "${release}" == "debian" ]]; then
		bash <(curl -fsSL git.io/warp.sh) menu
	fi
}


#开始菜单
start_menu(){
clear
echo && echo -e " Wisdom 一键安装管理脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}

————————————系统升级与安装————————————
 ${Green_font_prefix}1.${Font_color_suffix}  更新当前系统
 ${Green_font_prefix}2.${Font_color_suffix}  安装curl vim sudo
 ${Green_font_prefix}3.${Font_color_suffix}  安装ssh
 ${Green_font_prefix}4.${Font_color_suffix}  安装Statu配置
 ${Green_font_prefix}5.${Font_color_suffix}  安装docker
 ${Green_font_prefix}6.${Font_color_suffix}  安装docker-compose
 ${Green_font_prefix}7.${Font_color_suffix}  安装Statu配置&docker
 ${Green_font_prefix}8.${Font_color_suffix}  编译安装WireGuard
————————————相关配置服务——————————————
 ${Green_font_prefix}11.${Font_color_suffix} 运行旧tcp加速
 ${Green_font_prefix}12.${Font_color_suffix} 运行新tcp加速
 ${Green_font_prefix}13.${Font_color_suffix} 运行iptable端口转发
 ${Green_font_prefix}14.${Font_color_suffix} 添加虚拟内存
 ${Green_font_prefix}15.${Font_color_suffix} DNS流媒体解锁服务
 ${Green_font_prefix}16.${Font_color_suffix} 流媒体解锁测试
 ${Green_font_prefix}17.${Font_color_suffix} 测速
 ${Green_font_prefix}18.${Font_color_suffix} 回程测试
 ${Green_font_prefix}19.${Font_color_suffix} warp网络添加
————————————扶梯软件相关——————————————
 ${Green_font_prefix}21.${Font_color_suffix} 233boy一键脚本
 ${Green_font_prefix}22.${Font_color_suffix} soga安装
 ${Green_font_prefix}23.${Font_color_suffix} v2board正式版更新
 ${Green_font_prefix}24.${Font_color_suffix} v2board测试版更新
 ${Green_font_prefix}25.${Font_color_suffix} sogaのdocker-compose更新
————————————退出脚本——————————————————
 ${Green_font_prefix}0.${Font_color_suffix}  退出脚本
—————————————————————————————————————" && echo

echo
read -p " 请输入数字 :" num
case "$num" in
	1)
	update
	;;
	2)
	install_curl
	;;
	3)
	install_ssh
	;;
	4)
	install_statu
	;;
	5)
	install_docker
	;;
	6)
	install_docker_compose
	;;
	7)
	install_docker_statu
	;;
	8)
	install_wireguard
	;;
	11)
	install_old_tcp
	;;
	12)
	install_new_tcp
	;;
	13)
	iptable
	;;
	14)
	swap
	;;
	15)
	dns
	;;
	16)
	nf
	;;
	17)
	speed
	;;
	18)
	route
	;;
	19)
	warp
	;;
	21)
	233boy
	;;
	22)
	soga
	;;
	23)
	v2board
	;;
	24)
	v2board_dev
	;;
	25)
	soga_update
	;;
	0)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-25]"
	sleep 1s
	start_menu
	;;
esac
}

#检查系统
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
	
#处理ca证书
	if [[ "${release}" == "centos" ]]; then
		yum install ca-certificates -y
		update-ca-trust force-enable
	elif [[ "${release}" == "debian" || "${release}" == "ubuntu" ]]; then
		apt-get install ca-certificates -y
		update-ca-certificates
	fi	
}

#检查Linux版本
check_version(){
	if [[ -s /etc/redhat-release ]]; then
		version=`grep -oE  "[0-9.]+" /etc/redhat-release | cut -d . -f 1`
	else
		version=`grep -oE  "[0-9.]+" /etc/issue | cut -d . -f 1`
	fi
	bit=`uname -m`
	if [[ ${bit} = "x86_64" ]]; then
		bit="x64"
	else
		bit="x32"
	fi
}

#############系统检测组件#############
check_sys
check_version
[[ ${release} != "debian" ]] && [[ ${release} != "ubuntu" ]] && [[ ${release} != "centos" ]] && echo -e "${Error} 本脚本不支持当前系统 ${release} !" && exit 1
start_menu
