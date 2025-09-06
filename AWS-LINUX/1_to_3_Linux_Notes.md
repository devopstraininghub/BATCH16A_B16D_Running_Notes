12-06-2025
============
AWS ACCOUNT 

EC2 INSTANCE /SERVER /VM - AMAZON LINUX OS --- CREATED 

GIT BASH 

==========
whoami

sudo su - 

hostname

hostnamectl set-hostname <server.name>

sudo su - 

hostname -I 

uname 

uname -a

date 

uptime 

====================

touch file1 file2 file3 

mkdir dir1 dir2 dir3 

pwd

rm -rf fname/dirname 

ls 

ll

ls -lrth

ls -la 

clear --> ctrl + L 

cd dir.name

cd ..


cat fname 

======================

yum install <java>
yum install <git >

apt install <java>

==============
```
[root@linuxserver ~]# history

    1  hostname
    2  hostname -I
    3  uname
    4  uname -a
    5  date
    6  uptime
    7  pwd
    8  clear
    9  pwd
   10  ls
   11  ll
   12  touch f1 f2 f3
   13  ls
   14  ll
   15  mkdir dir1 dir2 dir3
   16  ll
   17  clear
   18  ll
   19  rm -rf f2
   20  ll
   21  rm -rf dir2
   22  ll
   23  pwd
   24  cd dir1
   25  pwd
   26  ll
   27  mkdir testdir
   28  ll
   29  cd testdir/
   30  pwd
   31  cd ..
   32  pwd
   33  cd ..
   34  pwd
   35  ll
   36  touchjenkins
   37  tauch jenkins
   38  touch jenkins
   39  ll
   40  vim jenkins
   41  ll
   42  cat jenkins
   43  git
   44  java
   45  yum install java
   46  java --version
   47  yum install git
   48  git --version
   49  history
```


==========================================
date: 13 june 25 

root dir --> / 

Filesystem Hierarchy Standard (FHS):
 
 
The Filesystem Hierarchy Standard (FHS) is a set of guidelines that define the structure and organization of directories and files on Unix-like operating systems, including Linux. It aims to ensure consistency and compatibility between different distributions of Linux, making it easier for software developers, administrators, and users to navigate and understand the file system. Here are the key components of the FHS:

Root Directory (/)
/bin: Essential command binaries that are required for system operation (e.g., ls, cp, mv).

/boot: Files needed for the boot process, including boot loader configuration files and kernels.

/dev: Device files representing hardware devices attached to the system (e.g., /dev/sda for the first SATA drive).

/etc: Configuration files for the system and installed applications (e.g., /etc/passwd for user information).

/home: Home directories for regular users (e.g., /home/ec2-user).

/lib: Shared libraries needed by programs in /bin and /sbin.

/media: Mount points for removable media (e.g., USB drives).

/mnt: Mount points for temporary mounted filesystems.

/opt: Optional software packages that are not part of the operating system distribution.

/sbin: System binaries essential for system administration, typically used by the root user.

/srv: Data for services provided by the system (e.g., web server data).

/tmp: Temporary files that may be deleted between reboots.

/usr: Secondary hierarchy for read-only user data; contains the majority of user utilities and applications.

/var: Variable data files, such as logs, spool files, and temporary files that persist between reboots.

---------------------

root --> /
ll
/bin – binary or executable programs.
 /sbin – binary executable programs for an administrator.
/etc – system configuration files.
/home – home directory. It is the default current directory.
/root - home directory of root user 
/opt – optional or third-party software.
/tmp – temporary space, typically cleared on reboot.
/usr – User related programs.
/var – log files.

========================

nested dir 

mkdir -p a/b/c/d/e


cp <src.path> <dest>


absolute path 
relative path 


mv <src.path> <dest>

=========================

useradd madhu 
 
passwd <uname> 

su - uname

sudo su - uname 

cat etc/passwd

userstanga

usermod -c "DevOpsUser" madhu

userdel -r uname 

===================================

cat /etc/passwd

tail -n /etc/passwd

head -n <fname 

more fname

==================

wc  /etc/passwd

wc -l /etc/passwd

wc  -w /etc/passwd

wc  -c /etc/passwd

=================================

yum install java 


===============================================
