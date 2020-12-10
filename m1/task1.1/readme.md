# EPAM University Programs

## DevOps education program
### Module 1 DevOps Introduction


#### TASK 1.1
1. Install GIT on your workstation.
```apt -y install git```
2. Setup git: change your global configs (add name and email, setup core text editor).
```
git config --global user.name "Oleksii Volchenko"
git config --global user.email "alexey.dnepr.ua2@gmail.com"
ssh-keygen -t rsa -b 4096 -C "alexey.dnepr.ua2@gmail.com"
cat << EOF
yes
EOF
git config --global core.editor vi
```
3. Create account on GitHub.+
4. Create new private repo on GitHub.
Repo name: DevOps_online_<City>_<year><quarter> Example: DevOps_online_Dnipro_2020Q42021Q1 +
5. You can see example repository structure.+
6. Clone repo to your workstation.
```git clone```
7. Open git console in root directory of your project and make next steps. +
8. Do all your experiments in folder “task1.1”.+
9. Create empty readme.txt file.
```touch readme.txt```
10. Make init commit.
	```git init
	git add .
	git commit -m "1st"```
	
11.	Create develop branch and checkout on it.
	```git checkout -b develop```
12.	Create index.html empty file. Commit.
	```
	echo "" > index.html
	git add index.html
	git commit -m "index.html"
	```
13.	Create branch with name “images”. Checkout on it. Add images folder with some images inside it. Commit.
	```
	git checkout -b images
	wget https://git-scm.com/images/logos/downloads/Git-Logo-Black.png
	wget https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png
	```
14.	Change your index.html. Add images source inside it. Commit.
	```
	git add .
	git commit -m "Added images source"
	```
15.	Go back to develop branch.
	```git checkout develop```
16.	Create branch with name “styles”. Checkout on it. Add styles folder with styles source inside it. Commit.
	```
	git checkout -b styles
	mkdir styles | cd styles
	echo > styles.html
	git add .
	git commit -m "Created styles folder with styles"
	```
17.	Change your index.html. Commit.
	```
	git checkout develop
	git add .
	git commit -m "modified index.html and add some links"
	```
18.	Go to develop branch. +
19.	Merge two new branches into develop using git merge command. Resolve conflict if it appear. Do it in next sequence:
	* merge “images” into “develop”
	* merge “styles” into “develop”
	* Do not delete any branches!

```	
	git merge images styles
```

20.	Merge develop into master.
```
	git checkout master
	git merge develop
```
21.	Try to inspect your repository with git log command. Use different options with this command (git log --help).
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 18:48:48 2020 +0200
>
>    Added task1.1._GIT.txt
>
>commit 796dcbf58abfeb3056e2683e0781129ae8d611b1 (develop)
>Merge: e408d6f c5bad9b 761c495
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:37:07 2020 +0200
>
>    Merge branches 'images' and 'styles' into develop
>
>commit e408d6f6e3fc6de862ac4f1f6aed87d7ee32c725
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:31:29 2020 +0200
>
>    modified index.html and add some links
>
>commit 761c49533d007c0a1a701d6970311a977766471c (styles)
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:23:21 2020 +0200
>
>   Created styles folder with styles
>
>commit c5bad9b8c74c2dab3923df9ffd07a322ecd508d2 (images)
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:16:33 2020 +0200
>
>    Added images source
>
>commit e546e987ab7d92b5bd71c64a2eb59f0bb443a0e0
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:13:34 2020 +0200
>
>    index.html
>
>commit 1fc4231ea3f8c545706c0ffa46d786ed8eb08bc9
>Author: Oleksii Volchenko <alexey.dnepr.ua2@gmail.com>
>Date:   Thu Dec 10 17:10:31 2020 +0200
>
>   Created readme.txt

22.	Push all your changes with all your branches to origin (git push origin --all).
	```
	git remote add origin git@github.com:Twicer/DevOps_online_Dnipro_2020Q42021Q1.git
	git push origin master
	```
23.	Execute command “git reflog“ and save it content somewhere (not in repository) with filename “task1.1_GIT.txt”.
	```git reflog > /home/main/Desktop/task1.1_GIT.txt```
24.	Add in repository your trainers as collaborators (see GitHub accounts in General-->Wiki--> Trainers team).
>Repo > Settings > Manage Access > Invite a collaboration
25.	Add task1.1_GIT.txt to your local repo in then Push it in GitHub repo.
	```
	cp /home/main/Desktop/task1.1_GIT.txt /home/main/Desktop/MAPE-BAL/
	git add task1.1_GIT.txt
	git commit -m "Added task1.1._GIT.txt"
	git push origin master
	```
26.	Make file readme.md in folder task1.1 and describe results of your work with Git. +
27.	Describe in your own words what DevOps is. Try to use not more 50 words. Do not use ctrl-C/ctrl-V.

>DevOps is not just a set of techniques, it is a philosophy. User-centered developers pay attention to support and support requests. Sysadmins reporting problems
>product and contribute to improving the work process.
>DevOps is a cultural movement that is changing people's attitudes towards work and towards
>its results. Thanks to the introduction of DevOps, intentional processes are formed that accelerate business efficiency. This contributes
>to the earliest possible result from social and technical innovations.
28.	Insert your text about DevOps in readme.md. +

29. Pictures
	![Git-Icon-1788C.png](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m1/task1.1/Git-Icon-1788C.png)
	![Git-Logo-Black.png](https://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/blob/master/m1/task1.1/Git-Logo-Black.png)
30. [My Github Project](httpshttps://github.com/Twicer/DevOps_online_Dnipro_2020Q42021Q1/tree/master/m1/task1.1 "Oleksii Volchenko")
