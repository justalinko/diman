#!/bin/bash
#################################################
# c0ded by : shutdown57 a.k.a alinko            #
# Copyright (c) 2016 || Dec 11 2016             #
# Diman (DiskManager)      || Debian Based      #
# Version 1.2 codename KopiHitam                #
# https://github.com/alintamvanz/diman          #
# alinkokomansuby@gmail.com - linuxcode.org     #
#################################################
# You can edit , redistribute and copying This file Under GPL (General Public License v3)

m="\033[1;31m"
k="\033[1;33m"
h="\033[1;32m"
b="\033[1;34m"
n="\033[1;0m"
DimanConfirm(){
	printf "\n\n\n"
	echo "Press ENTER to continue.."
	read enter
	printf "\n\n\n"
	clear
	Diman
}
Diman(){
echo -e $m" ██████╗ ██╗███╗   ███╗ █████╗ ███╗   ██╗ "
echo -e $m" ██╔══██╗██║████╗ ████║██╔══██╗████╗  ██║ "
echo -e $k" ██║  ██║██║██╔████╔██║███████║██╔██╗ ██║ "
echo -e $k" ██║  ██║██║██║╚██╔╝██║██╔══██║██║╚██╗██║ "
echo -e $h" ██████╔╝██║██║ ╚═╝ ██║██║  ██║██║ ╚████║ "
echo -e $h" ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ "
echo -e $n"+-----------------------------------------+"
echo -e $n"+       ~[ LINUX DISK MANAGER ]~          +"
echo -e $n"+----====|$m Codename  :$h KopiHitam          $n+"
echo -e $n"++---====|$m Version   :$h 1.2                $n+"
echo -e $n"+++--====|$m Author    :$h alinko(shutdown57) $n+"
echo -e $n"++++-====|$m Site      :$h linuXcode.org      $n+"
echo -e $n"+       ~[ COPYRIGHT (c) 2k16  ]~         +"
echo -e $n"+-----------------------------------------+"

echo " 1 ) SCAN DISK"
echo " 2 ) MENAGE PARTITION DISK. (CFDISK)"
echo " 3 ) MENAGE PARTITION DISK. (CGDISK)"
echo " 4 ) CREATE EXT4 SYSTEM"
echo " 5 ) CREATE EXT3 SYSTEM"
echo " 6 ) CREATE FAT32 SYSTEM"
echo " 7 ) CREATE NTFS SYSTEM"
echo " 8 ) CREATE BOOTABLE FLASHDISK."
echo " 9 ) SYNC"
                                        
echo -n -e "@DiMan ] :"
read pil
if [[ $pil == "1" ]]; then
	fdisk -l
	DimanConfirm
elif [[ $pil == "2" ]]; then
	echo -n "location ] :"
	read loc
	cfdisk $loc
	DimanConfirm
elif [[ $pil == "3" ]]; then
   echo -n "location ] :"
   read loc
   cgdisk $loc
   DimanConfirm
elif [[ $pil == "4" ]]; then
	echo -n "location ] :"
	read loc
	echo -n "Partition name ] :"
	read name
	mkfs.ext4 $loc -n $name
	DimanConfirm
elif [[ $pil == "5" ]]; then
	echo -n "location ] :"
	read loc
	echo -n "Partition name ] :"
	read name
	mkfs.ext3 $loc -n $name
	DimanConfirm
elif [[ $pil == "6" ]]; then
	echo -n "location ] :"
	read loc
	echo -n "Partition name ] :"
	read name
	mkfs.fat $loc -n $name
	DimanConfirm
elif [[ $pil == "7" ]]; then
	echo -n "location ] :"
	read loc
	echo -n "Partition name ] :"
	read name
	mkfs.ntfs $loc -n $name
	DimanConfirm
elif [[ $pil == "8" ]]; then
	echo -n "path .iso file ] :"
	read iso
	echo -n "FDD location ] :"
	read fdd
	sudo dd bs=4M if=$iso of=$fdd status=progress
	DimanConfirm
elif [[ $pil == "9" ]]; then
	sync
	DimanConfirm
fi

}
if [[ `whoami` == "root" ]]; then
	Diman
else
	echo "Please,run it as root."
fi
