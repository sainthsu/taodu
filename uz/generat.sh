#!/bin/bash

echo "======generate uz==========>"
echo "#将一下复制到app.yml" > yml.txt
echo "#将一下复制到index.tpl <div class="uzHidden"><ul>???<ul></div> 之间" > url.txt
for dir in `ls`
do
	if [ -d "$dir" ];then
		cp -f index.php "./"$dir"/"
		echo $dir":copyed"
		echo "- {handler: /uz/$dir/index.php, url: /$dir}" >> yml.txt
		echo "<li><a href='/uz/$dir/index.php'>$dir</a></li>" >> url.txt
	else
		echo $dir" is not a dir!"
	fi
done
echo "#=======short url==========" >> url.txt
for dir in `ls`
do
	echo "<li><a href='/d/$dir'>$dir</a></li>" >> url.txt
done
echo "<======generate done=========="
