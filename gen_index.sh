#!/bin/bash

echo "# My personl link page" > index.md

for f in ./peronal-links.wiki/*; do
	title="$(cat $f | sed -n '/---/,/---/p'  | grep title: | sed 's/^........//' | sed  's/.$//')"
	description="$(cat $f | sed -n '/---/,/---/p'  | grep description: | sed 's/^..............//' | sed  's/.$//')"
	if [ "$title" ]; then
		echo "[$title]($f) $description \n" >> index.md
	fi	
done


