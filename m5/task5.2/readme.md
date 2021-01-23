# EPAM University Programs

## DevOps education program
### Module 5 Linux Essentials


#### TASK 2
1) Analyze the structure of the /etc/passwd and /etc/group file, what fields are
present in it, what users exist on the system? Specify several pseudo-users, how
to define them?

/etc/passwd
Each line in the file represents one user and
contains seven fields separated by colons:
* Login name
* Encrypted password placeholder (see page 179)
* UID (user ID) number
* Default GID (group ID) number
* “GECOS” information: full name, office, extension, home phone
* Home directory
* Login shell

username: pswd: uid: gid: uidcomments: directory: shell

```sh
root:x:0:0:root,Dnipro,no,no:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
games:x:12:100:games:/usr/games:/sbin/nologin
ftp:x:14:50:FTP User:/var/ftp:/sbin/nologin
nobody:x:65534:65534:Kernel Overflow User:/:/sbin/nologin
dbus:x:81:81:System message bus:/:/sbin/nologin
systemd-coredump:x:999:997:systemd Core Dumper:/:/sbin/nologin
systemd-resolve:x:193:193:systemd Resolver:/:/sbin/nologin
tss:x:59:59:Account used by the trousers package to sandbox the tcsd daemon:/dev/null:/sbin/nologin
polkitd:x:998:996:User for polkitd:/:/sbin/nologin
libstoragemgmt:x:997:995:daemon account for libstoragemgmt:/var/run/lsm:/sbin/nologin
unbound:x:996:993:Unbound DNS resolver:/etc/unbound:/sbin/nologin
clevis:x:995:991:Clevis Decryption Framework unprivileged user:/var/cache/clevis:/sbin/nologin
cockpit-ws:x:994:990:User for cockpit web service:/nonexisting:/sbin/nologin
cockpit-wsinstance:x:993:989:User for cockpit-ws instances:/nonexisting:/sbin/nologin
sssd:x:992:988:User for sssd:/:/sbin/nologin
setroubleshoot:x:991:987::/var/lib/setroubleshoot:/sbin/nologin
sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
```
I defined several pseudo-users by UID.
In general a pseudo-users associated with special programs
root,daemons,pseudo-users,system and reserved users, regular users


daemon- Used by system service processes
bin- Gives ownership of executables command 
adm- Owns registration files 
nobody- Used by many services 
sshd– used by the secure shell server.

/etc/group 
Each line represents one group and contains four fields:
* Group name
* Encrypted password or a placeholder
* GID number
* List of members, separated by commas (be careful not to add spaces)

2) What are the uid ranges? What is UID? How to define it?
UID is a simple numeric designation for an individual user.
* 0-65535
* 0 root
* 1-999 daemons, pseudo-users, system reserved users , regular users

username: pswd: **uid**: gid: uidcomments: directory: shell

3) What is GID? How to define it?

GID is Group indetifier. U can define in file /etc/group and pin in /etc/passwd
username: pswd: uid: **gid**: uidcomments: directory: shell

4) How to determine belonging of user to the specific group?
By file /etc/passwdor command ```groups``` or ````groupmems -list```

5) What are the commands for adding a user to the system? What are the basic parameters required to create a user?
```useradd``` / ```adduser```
Required:
* Edit the passwd and shadow files or create by commands to define the user’s account 
* Add the user to the /etc/group file (not really necessary, but nice).
* Set an initial password ( set lifetime or another attr by command ```passwd```)
* Create, chown, and chmod the user’s home directory.
* Configure roles and permissions (RBAC - Role-based acess control)
* Copy default startup files to the user’s home directory.
* Set the user’s mail home and establish mail aliases.
For you:
* Verify that the account is set up correctly.
* Add the user’s contact information and account status to your database.

6) How do I change the name (account name) of an existing user?
The First - By ```usermod --login newUsername oldUsername```  command.
The Second - change home directory```usermod --login new_username --move-home --home path_to_the_new_home_dir old_username```
The third -  change group ```groupmod --new-name new_username old_username```

7) What is skell_dir? What is its structure?

Directory /etc/skel/ (skel is derived from the “skeleton”) is used to initiate home directory when a user is first created. A sample layout of “skeleton” user files is as shown below:
```sh
# ls -lart /etc/skel
total 32
drwxr-xr-x    4 root root  4096 Feb  4  2016 .mozilla
-rw-r--r--    1 root root   124 Feb 15  2017 .bashrc
-rw-r--r--    1 root root   176 Feb 15  2017 .bash_profile
-rw-r--r--    1 root root    18 Feb 15  2017 .bash_logout
drwxr-xr-x.   3 root root  4096 Aug 22  2017 .
drwxr-xr-x. 112 root root 12288 Feb 26 03:09 ..
```

skell directory is defined in /etc/default/useradd file.
– Default permission of /etc/skel is drwxr-xr-x.
– It is not recommended to change the permission of skel directory or its contents. Changing the permission may possibly break some of the program, because in skel directory there are some profiles that needs the permission of read and trying to give it permission of execute will cause some programs/profiles to work unexpectedly.


8) How to remove a user from the system (including his mailbox)?

By ```usermod``` command with flag ```--remove``` and MAIL_DIR

The mail spool is defined by the MAIL_DIR variable in the login.defs file.

9) What commands and keys should be used to lock and unlock a user account?
You can use two ways:
a) ```usermod``` command with keys ```--lock``` or ```--unlock```;
b) You can change the password to NULL variable and then all passwords will be undefined but in my opinion, this way is incorrect. 
```passwd``` with keys ```--lock``` / ```--unlock``` or setting ```!``` symbol before encrypted password in /etc/shadow file 
> That account not fully locked.

10) How to remove a user's password and provide him with a password-free login for subsequent password change?
```passwd --delete `udername` ``` 
  -d, --delete            delete the password for the named account (root only); also removes password lock if any
						  
11) Display the extended format of information about the directory, tell about the information columns displayed on the terminal.
```ls -aldi /usr```
```33575046 drwxr-xr-x. 12 root root 144 Jan 15 13:59 /usr```
>inode:directory+premission(include sticky bit):num:user:group;size;date+time:filename

12) What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.
>read;write;execution;stickybit for users/groups/other

13) What is the sequence of defining the relationship between the file and the user? 
> permissions

14) What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal.
```chmod``` 
*Give the [u]ser who owns a file the right to e[x]ecute it:
```chmod u+x {{file}}```

*Give the [u]ser rights to [r]ead and [w]rite to a file/directory:
```chmod u+rw {{file_or_directory}}```

*Remove e[x]ecutable rights from the [g]roup:
```chmod g-x {{file}}```

*Give [a]ll users rights to [r]ead and e[x]ecute:
```chmod a+rx {{file}}```

*Give [o]thers (not in the file owner's group) the same rights as the [g]roup:
```chmod o=g {{file}}```

*Remove all rights from [o]thers:
```chmod o= {{file}}```

*Change permissions recursively giving [g]roup and [o]thers the ability to [w]rite:
```chmod -R g+w,o+w {{directory}}```
or 

```chmod 123``` where
bit
0 ---
1 x
2 w
3 wx
4 r
5 rx
6 rw
7 rwx
and the first bit user, second group, third other.
Also you can set up sticky bit by ```+t``` key or ```1``` before the first permission bit.
For installing SUID you can ude ```u+s``` key.
>When the SUID bit is set on an executable file, this means that the file will be executed with the same permissions as the owner of the executable file.
For GGID - ```g+s``` key.

If you need change anothers attributes you can use ```chattr```
       The  operator  '+'  causes  the  selected  attributes  to  be added to the existing
       attributes of the files; '-' causes them to be removed; and '=' causes them  to  be
       the only attributes that the files have.

       The letters 'aAcCdDeFijPsStTu' select the new attributes for the files: append only
       (a), no atime updates (A), compressed (c), no copy on write (C), no dump (d),  syn‐
       chronous  directory  updates  (D),  extent  format  (e), case-insensitive directory
       lookups (F), immutable (i), data journalling (j),  project  hierarchy  (P),  secure
       deletion  (s), synchronous updates (S), no tail-merging (t), top of directory hier‐
       archy (T), and undeletable (u).

       The following attributes are read-only, and may be listed by lsattr(1) but not mod‐
       ified  by chattr: encrypted (E), indexed directory (I), inline data (N), and verity
       (V).

       Not all flags are supported or utilized by all filesystems;  refer  to  filesystem-
       specific  man  pages such as btrfs(5), ext4(5), and xfs(5) for more filesystem-spe‐
       cific details.



15) What is an example of octal representation of access rights? Describe the
umask command.
```umask [-S] [mask]```
```-S```	Accept a symbolic representation of a mask, or return one.
```mask```	If a valid mask is specified, the umask is set to this value. If no mask is specified, the current umask value is returned.
The file creation mask can also be represented numerically, using octal values (the digits from 0 to 7). When using octal numeric representation, certain numbers represent certain permissions, and these numbers are added or subtracted from each other to represent the final, combined permissions value. Specifically, the numbers 1, 2, and 4 represent the following permissions:

| number 	| permission 	|
|:-:	|:-:	|
| 4 	| read 	|
| 2 	| write 	|
| 1 	| execute 	|

These numbers are used because any combination of these three numbers will be unique. The following table illustrates their unique combinations:

| read value + 	| write value + 	| execute value = 	| combined value: 	| symbolic equivalent: 	|
|:------------:	|:-------------:	|:---------------:	|:---------------:	|:--------------------:	|
|       0      	|       0       	|        0        	|        0        	|           -          	|
|       0      	|       0       	|        1        	|        1        	|           x          	|
|       0      	|       2       	|        0        	|        2        	|           w          	|
|       0      	|       2       	|        1        	|        3        	|          wx          	|
|       4      	|       0       	|        0        	|        4        	|           r          	|
|       4      	|       0       	|        1        	|        5        	|          rx          	|
|       4      	|       2       	|        0        	|        6        	|          rw          	|
|       4      	|       2       	|        1        	|        7        	|          rwx         	|

In octal representations of file permissions, there are actually four digits. The three important digits are the last three digits. The first digit is a special file permission indicator, and for the purposes of this discussion can be considered always to be zero. So from here on out, when we discuss file permission 777, it may also be referred to as 0777.


16) Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes.
Restricted Deletion Flag (or "Sticky Bit")
The restricted deletion flag or sticky bit is a single bit, whose interpretation depends on the file type. For directories, it prevents unprivileged users from removing or renaming a file in the directory unless they own the file or the directory; this is called the restricted deletion flag for the directory, and is commonly found on world-writable directories like /tmp. For regular files on some older systems, the bit saves the program's text image on the swap device so it will load more quickly when run; this is called the sticky bit.

17) What file attributes should be present in the command script?
```chmod u+x bashfile.sh``` or ``` chmod ugo +x bashfile.sh```
