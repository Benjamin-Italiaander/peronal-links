#!/bin/bash
git clone https://github.com/Benjamin-Italiaander/peronal-links.wiki.git


# GENERATE MD file for in Github
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
# END RENERATE MD file





# Generate index file for html

rm -rf ./site
rm -rf ./docs
mv ./peronal-links.wiki ./docs
rm ./docs/Home.md
rm -rf ./docs/*Footer*

cp ./README.md ./docs/index.md
mkdocs build
mv  ./site/* ./ 
rm -rf ./docs

rm -rf ./peronal-links.wiki/
rm -rf ./site
git add *
git commit -am "index"
git push
