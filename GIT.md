# GIT

## 	

1. git am ***.patch 补丁格式探测失败

   patch -p1 < ***.patch （不要commit信息即可）

   git format-patch HEAD^

2. 修改git commit的用户名

   git commit --amend --author="Fang Tan"

3. 删除本地分支

   git branch -D BranchName

   其中-D也可以是--delete

   git branch --delete BranchName

4. 删除远程服务器上的分支：

   git push origin -d BranchName

   其中-d也可以是--delete

   git push origin --delete BranchName

5. 同步上游分支

   git fetch upstream

   git checkout -b name upstream/name  #name为上游分支的名字

   git push -u origin name

6. 创建本地分支并推送到远程分支

   git push origin local_branch:remote_branch

7. 添加上游

   git remote add upstream git://github.****

   git fetch upstream

   git checkout master

   git merge upstream/master

   git push origin master

8. 

9. 

10. 注意事项

    git每次最好在自己的分支上做事

11. rebase

    git rebase会将指定的分支的提交复制到当前分支上

12. 主分支和上游同步

    1.新建一个分支tantan/kwin-master，并清空信息，然后和上游commit保持一致

    2.git fetch upstream master , git pull upstream master

    3.然后切换到master

    4.git rebase tantan/kwin-master

    5.git push origin master -f

13. 

    