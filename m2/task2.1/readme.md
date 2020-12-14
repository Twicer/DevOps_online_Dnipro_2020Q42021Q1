# EPAM University Programs DevOps education program

## Module 2 Virtualization and Cloud Basic TASK 2.1
#### PART 1. HYPERVISORS

##### 1.	What are the most popular hypervisors for infrastructure virtualization?

* XEN (Citrix XenServer)
* Hyper-V (Microsoft)
* Wmware ESXi/ESX)
* KVM
* KVM w/OpenStack

Slide #32  and
https://trends.google.ru/trends/explore?date=today%205-y&q=XEN,Hyper-V,Wmware,%2Fm%2F0cm87w_,%2Fm%2F0272hgj

##### 2.	Briefly describe the main differences of the most popular hypervisors.
---
* Cloud based
* Native or bare-metal hypervisors
* Hosted
---
* Free / Open source
* Paid
---
* With GUI
* Without GUI
---
* Supported architectures and functions
---
KVM is built into Linux as an added functionality. It lets you convert the Linux kernel into a hypervisor.It has direct access to hardware along with virtual machines it hosts. KVM is an open-source hypervisor that contains all the features of Linux with the addition of many other functionalities. This makes it one of the top choices for enterprise environments. Some of the highlights include live migration, scheduling and resource control, alongside higher prioritization.

Microsoft Hyper-V briefly known before its release as Windows Server Virtualization, is a native hypervisor; it can create virtual machines on x86-64 systems running Windows or Azure.
Despite VMware’s hypervisor being higher on the ladder with its numerous advanced features, Microsoft’s Hyper-V has become a worthy opponent. Microsoft also offers a free edition of their hypervisor, but if you want a GUI and additional functionalities, you will have to go for one of the commercial versions. Hyper-V may not offer as many features as VMware vSphere package, but you still get live migration, replication of virtual machines, dynamic memory and many other features.

Xen is a type-1 virtual machine, providing services that allow multiple computer operating systems to execute on the same computer hardware concurrently. It was originally developed by the University of Cambridge Computer Laboratory and is now being developed by the Linux Foundation with support from Intel. 

https://en.wikipedia.org/wiki/Comparison_of_platform_virtualization_software



#### PART 2. WORK WITH VIRTUALBOX

```
wget https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Debian~buster_amd64.deb
dpkg -i ./virtualbox-6.1_6.1.16-140961~Debian~buster_amd64.deb
```
or
```
apt -y install ./virtualbox-6.1_6.1.16-140961~Debian~buster_amd64.deb
```
Install ExtensionPack (Said Yes| y )
```
wget http://download.virtualbox.org/virtualbox/6.1.0_RC1/Oracle_VM_VirtualBox_Extension_Pack-6.1.0_RC1.vbox-extpack
VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.0_RC1.vbox-extpack
```


Added the Current User to the VirtualBox Users Group
```
adduser debian vboxusers
```
List OS types supported by installed Virtual Box software.
```
VBoxManage list ostypes
```
Created and register the VM
```
VBoxManage createvm --name "UbuntuServer20LTS" --register
```

Configured Server with RAM1GB ACPI NIC and Boot
```
VBoxManage modifyvm "UbuntuServer20LTS" --cpus 1 --memory 1024 --acpi on --boot1 dvd --nic1 bridged --bridgeadapter1 enp3s0 --ostype Ubuntu_64
```
Created VHDD
```
VBoxManage createhd --filename UbuntuServer20LTSVHDD.vdi --size 10000
```

I moved VHHD to work directory
```
rsync --archive --remove-source-files UbuntuServer20LTSVHDD.vdi ~/VirtualBox\ VMs/UbuntuServer20LTS/
```
> I didn't have a command move - "mv" . I used "rsync". Yes, i i could use "cp" and "rm" or hard/soft links.

Created a VirtualIDE + attached a VHD
```
VBoxManage storagectl "UbuntuServer20LTS" --name "IDE Controller" --add ide
VBoxManage storageattach "UbuntuServer20LTS" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium UbuntuServer20LTSVHDD.vdi
```

Download Ubuntu 20.10 server amd64
```
wget https://releases.ubuntu.com/20.10/ubuntu-20.10-live-server-amd64.iso
```
Attached ISO
```
VBoxManage storageattach "UbuntuServer20LTS" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium ubuntu-20.10-live-server-amd64.iso
```

Information about VM 
```
VBoxManage showvminfo "UbuntuServer20LTS"
```
START!
```
VBoxHeadless --startvm "UbuntuServer20LTS"
```
Snapshot
```
VBoxManage snapshot "UbuntuServer20LTS" take Snapshot_1_afterInstall
```
Revert back to a particular snapshot
```
VBoxManage snapshot "UbuntuServer20LTS" restore Snapshot_1_afterInstall
```
Headless Options
```
VBoxManage controlvm "UbuntuServer20LTS" poweroff
VBoxManage controlvm "UbuntuServer20LTS" pause
VBoxManage controlvm "UbuntuServer20LTS" reset
VBoxManage controlvm "UbuntuServer20LTS" resume
VBoxManage controlvm "UbuntuServer20LTS" savestate
VBoxManage controlvm "UbuntuServer20LTS" acpipowerbutton
VBoxManage controlvm "UbuntuServer20LTS" acpisleepbutton
```
> OR I could use special cloud image
http://cloud-images.ubuntu.com/

See screenshots, please [click here](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m2/task2.1/screens/readme.md)
#### PART 3. WORK WITH VAGRANT


