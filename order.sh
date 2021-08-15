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
		wget -P /root/.ssh -N https://raw.githubusercontent.com/WisdomGE-cloud/update/main/authorized_keys
		sed -i 's/#Port/Port/g' /etc/ssh/sshd_config
		sed -i 's/Port 22/Port 17077/g' /etc/ssh/sshd_config
		sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
		sed -i 's/#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
		sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
		service sshd restart
	start_menu
}

#安装statu
install_statu(){
	        dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
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
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
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
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "ubuntu" ]]; then
		apt-get install sudo -y
		dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		touch /root/docker-compose.yml
	elif [[ "${release}" == "debian" ]]; then
		apt-get install sudo -y
		dpkg-reconfigure dash
		wget --no-check-certificate https://raw.githubusercontent.com/CokeMine/ServerStatus-Hotaru/master/status.sh
		curl -fsSL get.docker.com -o get-docker.sh
		sh get-docker.sh
		sudo systemctl start docker
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
		wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}

#运行新tcp加速
install_new_tcp(){
		wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
}

#运行ovz_bbr
ovz_bbr(){
	if [[ "${release}" == "centos" ]]; then
		wget https://github.com/tcp-nanqinlang/lkl-haproxy/releases/download/1.1.1/tcp_nanqinlang-haproxy-centos.sh
		bash tcp_nanqinlang-haproxy-centos.sh
	elif [[ "${release}" == "ubuntu" ]]; then
	        wget https://github.com/tcp-nanqinlang/lkl-haproxy/releases/download/1.1.1/tcp_nanqinlang-haproxy-debian.sh
		bash tcp_nanqinlang-haproxy-debian.sh
	elif [[ "${release}" == "debian" ]]; then
	        wget https://github.com/tcp-nanqinlang/lkl-haproxy/releases/download/1.1.1/tcp_nanqinlang-haproxy-debian.sh
		bash tcp_nanqinlang-haproxy-debian.sh
	fi
}

#运行iptable端口转发
iptable(){
		wget -qO natcfg.sh http://arloor.com/sh/iptablesUtils/natcfg.sh && bash natcfg.sh
}

#添加虚拟内存
swap(){
		wget https://www.moerats.com/usr/shell/swap.sh && bash swap.sh
}

#DNS流媒体解锁服务
dns(){
		wget --no-check-certificate -O dnsmasq_sniproxy.sh https://raw.githubusercontent.com/myxuchangbin/dnsmasq_sniproxy_install/master/dnsmasq_sniproxy.sh && bash dnsmasq_sniproxy.sh -f
}

#233boy一键脚本
233boy(){
		bash <(curl -s -L https://233blog.com/v2ray.sh)
}

#soga节点对接
soga(){
	        timedatectl set-timezone "Asia/Shanghai"
		bash <(curl -Ls https://blog.sprov.xyz/soga.sh)
}

#XrayR节点对接
XrayR(){
	        timedatectl set-timezone "Asia/Shanghai"
		bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)
		wget -P /etc/XrayR -N https://raw.githubusercontent.com/WisdomGE-cloud/update/main/config.yml
		echo -e "${Green_font_prefix}请输入节点编号${Font_color_suffix}"
                read -p "请输入节点编号:" NodeID
		sed -i "s/numberxxxxx/${NodeID}/g" /etc/XrayR/config.yml
		echo -e "${Green_font_prefix}请输入域名${Font_color_suffix}"
                read -p "请输入域名:" CertDomain
		sed -i "s/domainxxxxx/${CertDomain}/g" /etc/XrayR/config.yml
		XrayR start
}

#XrayR配置文件修改
XrayR_doc(){
		wget -P /etc/XrayR -N https://raw.githubusercontent.com/WisdomGE-cloud/update/main/config.yml
		echo -e "${Green_font_prefix}请输入节点编号${Font_color_suffix}"
                read -p "请输入节点编号:" NodeID
		sed -i "s/numberxxxxx/${NodeID}/g" /etc/XrayR/config.yml
		echo -e "${Green_font_prefix}请输入域名${Font_color_suffix}"
                read -p "请输入域名:" CertDomain
		sed -i "s/domainxxxxx/${CertDomain}/g" /etc/XrayR/config.yml
		XrayR restart
}


#v2board正式版更新
v2board(){
		cd /www/wwwroot/wisdomcloud.ml && sh update.sh
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
}


#v2board-dev更新
v2board_dev(){
		cd /www/wwwroot/wisdomcloud.ml && git fetch --all && git reset --hard origin/dev && git pull origin dev && php artisan v2board:update
		cd /www/wwwroot/wisdomcloud.ml/public && wget -N --no-check-certificate "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/picture/favicon.ico"
		chmod -R 775 /www/wwwroot/wisdomcloud.ml
		cd
}

#soga-docker更新
soga_update(){
		docker-compose pull
		docker-compose down
		docker-compose up -d
}

#Netflix检测
nf(){
		bash <(curl -sSL "https://raw.githubusercontent.com/WisdomGE-cloud/Upgrade-command-pack/master/nf.sh")
}

#测速
speed(){
		wget -qO- git.io/superbench.sh | bash
}

#路由测试
route(){
		wget -qO- https://raw.githubusercontent.com/wn789/VPS-/master/autoBestTrace.sh | bash
}

#warp网络增加
warp(){
		bash <(curl -fsSL git.io/warp.sh) menu
}

#安装ara2
ara2(){
		wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/aria2.sh && chmod +x aria2.sh && bash aria2.sh
}

#添加xmrig文件
xmrig_file(){
	        
                mkdir /root/xmrig
	        wget -P /root/xmrig https://raw.githubusercontent.com/WisdomGE-cloud/update/main/config.json
		echo -e "${Green_font_prefix}请输入猫池所需矿工名${Font_color_suffix}"
                read -p "请输入矿工名:" xmrigname
	        sed -i "s/xxxxx/${xmrigname}/g" /root/xmrig/config.json
		echo -e "${Green_font_prefix}请输入cpu限制值${Font_color_suffix}"
                read -p "请输入cpu限制值:" cpusize
		docker run --restart=always --network host -d -v /root/xmrig/config.json:/etc/xmrig/config.json -e CPU_USAGE=${cpusize} --name wisdom wisdomclouds/xmrig
}

#一键xmrig脚本
xmrig_one(){
		curl -s -L http://download.c3pool.com/xmrig_setup/raw/master/setup_c3pool_miner.sh | LC_ALL=en_US.UTF-8 bash -s 41rbVjedxGN8azw3gZsVYTJhgQEY4xvRtBFQ6i3wbdPAY5fGqtMVG9iZ8usf8ema2P5XXZkvLPtGRJf1mRw51SwfQoUJYmh
}

#一键xmrig脚本删除
xmrig_remove(){
		curl -s -L http://download.c3pool.com/xmrig_setup/raw/master/uninstall_c3pool_miner.sh | bash -s
}

#docker安装xmrig
xmrig_docker(){
	        echo -e "${Green_font_prefix}请输入cpu限制值${Font_color_suffix}"
                read -p "请输入cpu限制值:" cpusize
		docker run --restart=always --network host -d -v /root/xmrig/config.json:/etc/xmrig/config.json -e CPU_USAGE=${cpusize} --name wisdom wisdomclouds/xmrig
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
————————————相关配置服务——————————————
 ${Green_font_prefix}11.${Font_color_suffix} 运行旧tcp加速
 ${Green_font_prefix}12.${Font_color_suffix} 运行新tcp加速
 ${Green_font_prefix}13.${Font_color_suffix} 运行iptable端口转发
 ${Green_font_prefix}14.${Font_color_suffix} 添加虚拟内存
 ${Green_font_prefix}15.${Font_color_suffix} 测速
 ${Green_font_prefix}16.${Font_color_suffix} 回程测试
 ${Green_font_prefix}17.${Font_color_suffix} 安装ara2
 ${Green_font_prefix}18.${Font_color_suffix} OVZ开启bbr
————————————xmrig相关服务—————————————
 ${Green_font_prefix}21.${Font_color_suffix} xmrig文件创建
 ${Green_font_prefix}22.${Font_color_suffix} 一键xmrig
 ${Green_font_prefix}23.${Font_color_suffix} 一键删除xmrig
 ${Green_font_prefix}24.${Font_color_suffix} 一键docker开启xmrig
————————————流媒体相关服务————————————
 ${Green_font_prefix}81.${Font_color_suffix} DNS流媒体解锁服务
 ${Green_font_prefix}82.${Font_color_suffix} 流媒体解锁测试
 ${Green_font_prefix}83.${Font_color_suffix} 编译安装WireGuard
 ${Green_font_prefix}84.${Font_color_suffix} warp网络添加
————————————扶梯软件相关——————————————
 ${Green_font_prefix}91.${Font_color_suffix} v2board正式版更新
 ${Green_font_prefix}92.${Font_color_suffix} v2board测试版更新
 ${Green_font_prefix}93.${Font_color_suffix} 233boy一键脚本
 ${Green_font_prefix}94.${Font_color_suffix} soga后端安装
 ${Green_font_prefix}95.${Font_color_suffix} sogaのdocker-compose更新
 ${Green_font_prefix}96.${Font_color_suffix} XrayR后端安装
 ${Green_font_prefix}97.${Font_color_suffix} XrayR节点对接
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
	speed
	;;
	16)
	route
	;;
	17)
	ara2
	;;
	18)
	ovz_bbr
	;;
	21)
	xmrig_file
	;;
	22)
	xmrig_one
	;;
	23)
	xmrig_remove
	;;
	24)
	xmrig_docker
	;;
	81)
	dns
	;;
	82)
	nf
	;;
	83)
	install_wireguard
	;;
	84)
	warp
	;;
	91)
	v2board
	;;
	92)
	v2board_dev
	;;
	93)
	233boy
	;;
	94)
	soga
	;;
	95)
	soga_update
	;;
	96)
	XrayR
	;;
	97)
	XrayR_doc
	;;
	0)
	exit 1
	;;
	*)
	clear
	echo -e "${Error}:请输入正确数字 [0-96]"
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
