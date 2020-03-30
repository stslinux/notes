git config --global user.name "Your Name"
git config --global user.email "email@example.com"
#建立仓库，添加文件，提交文件
git init
git add readme.txt
git commit -m "wrote a readme file"
git commit -am "modifies inf"
#-a表示add

#删除文件
git rm test.txt
git commit -am "rm"

#查看当前仓库状态
git status

#版本回退：HEAD^ HEAD^ HEAD~100
git reset --hard HEAD^
git reset --hard c993
git reset --hard commit_id
#查看历史记录
git log
git log --pretty=oneline

#用来记录你的每一次命令
git reflog

#把readme.txt文件在工作区的修改全部撤销
git checkout -- readme.txt

#创建SSH Key。在用户主目录下，看看有没有.ssh目录，如果有，再看看这个目录下有没有id_rsa和id_rsa.pub这两个文件，如果已经有了，可直接跳到下一步。
#如果没有，打开Shell（Windows下打开Git Bash），创建SSH Key.“Add SSH Key”，填上任意Title，在Key文本框里粘贴id_rsa.pub文件的内容
ssh-keygen -t rsa -C "youremail@example.com"

#把本地库的所有内容推送到远程库上
git push -u origin master

#从现在起，只要本地作了提交，就可以通过命令把本地master分支的最新修改推送至GitHub
git push origin master

#创建dev分支，然后切换到dev分支：
git checkout -b dev
等价于：
git branch dev
git checkout dev

#查看当前分支：
git branch

#把dev分支的工作成果合并到master分支上：
git merge dev

#删除dev分支了：
git branch -d dev

#git log --graph命令可以看到分支合并图。
git log --graph





