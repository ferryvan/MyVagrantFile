# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	n=1
	(1..n).each do |i|
		config.vm.define "k3s-#{i}" do |node|
			# 设置虚拟机的Box
            node.vm.box = "bento/ubuntu-18.04"
			#node.vm.box = "bento/centos-7"
			
			# VirtaulBox相关配置
			node.vm.provider "virtualbox" do |v|
				# 设置虚拟机的名称
				v.name = "k3s-#{i}"
				# 设置虚拟机的内存大小
				v.memory = 8192
				# 设置虚拟机的CPU个数
				v.cpus = 4
			end
		
			# 设置虚拟机的主机名
			node.vm.hostname="k3s-#{i}"

			# 设置虚拟机的IP
			node.vm.network "private_network", ip: "192.168.56.2#{i}"
			#node.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"
			# 将上一步设置的IP追加到每个主机的hosts文件里
			(1..n).each do |i|
				node.vm.provision "shell" do |s|
					s.inline = "echo '192.168.56.2#{i} k3s-#{i}' >> /etc/hosts"
				end
			end
			
			# 设置主机与虚拟机的共享目录
			node.vm.synced_folder "~/Desktop", "/home/vagrant/DesktopShare"
			node.vm.synced_folder "~/Downloads", "/home/vagrant/HostDownloads"
			#node.vm.synced_folder "./install-docker", "/home/vagrant/install-docker"
			#node.vm.synced_folder "/Volumes/T5SSD", "/home/vagrant/T5SSD"

			# ubuntu18.04初始化
			if node.vm.box.include? "ubuntu-18.04" then
				node.vm.provision "shell" , path: "./ubuntu-18.04/ubuntu-18.04-init.sh"
			end

			# 使用shell脚本进行配置
			node.vm.provision "shell", inline: <<-SHELL
        	    # private netowork互通
        	    #route add default gw 192.168.33.1
				#eval `route -n | awk '{ if ($8 ==\"eth0\" && $2 != \"0.0.0.0\") print \"route del default gw \" $2; }'`
			SHELL

		end
	end
end
