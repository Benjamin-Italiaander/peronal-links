#!/bin/bash
git clone https://github.com/Benjamin-Italiaander/peronal-links.wiki.git
echo -e "# My personal link page \n Here a keep track of intesting sites and stuff. \n" > README.md

echo " This page is generated with the gen_index.sh command"  >> README.md
echo -e " After making changes at the wiki you need to run the gen_index.sh to update this page \n" >> README.md

echo -e "# The links \n" >> README.md
for f in ./peronal-links.wiki/*; do
	title="$(cat $f | sed -n '/---/,/---/p'  | grep title: | sed 's/^........//' | sed  's/.$//')"
	if [ "$title" ]; then
		description="$(cat $f | sed -n '/---/,/---/p'  | grep description: | sed 's/^..............//' | sed  's/.$//')"
		url="$(echo $f | sed 's/^.....................//' | sed  's/...$//')"	
		echo -e "[$title](https://github.com/Benjamin-Italiaander/peronal-links/wiki/$url) $description \n" >> README.md
	fi	
done

rm -rf ./peronal-links.wiki/

#git add *
#git commit -am "index"
#git push
