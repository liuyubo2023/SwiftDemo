#!bin/bash
echo "----begin commit----"
git add .
git commit -m $1
echo $1
echo "----end----"
echo "----start push"
result=`git branch | grep "*"` # 获取分支名
curBranch=${result:2} # 去除多余的*
echo "当前分支 -- ${curBranch}"
git push origin $curBranch
echo "----done----"