#!/bin/bash
echo "# My personl link page" > readme.md

for f in ./peronal-links.wiki/*; do
	title="$(cat $f | sed -n '/---/,/---/p'  | grep title: | sed 's/^........//' | sed  's/.$//')"
	if [ "$title" ]; then
		description="$(cat $f | sed -n '/---/,/---/p'  | grep description: | sed 's/^..............//' | sed  's/.$//')"
		url="$(echo $f | sed 's/^...//')"
		echo "[$title](https://github.com/Benjamin-Italiaander/peronal-links/wiki/$url) $description \n" >> readme.md
	fi	
done


