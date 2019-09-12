#!bin/bash
echo "----begin commit----"
git add .
git commit -m $1
echo $1
echo "----end----"
git push origin master