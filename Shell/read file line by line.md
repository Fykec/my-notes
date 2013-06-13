# read file line by line

2013-05-29 10:15:24

	#!/usr/bin/bash
	
	filename="$1"
	while read -r line
	do
    	name=$line
    	echo "Name read from file - $name"
	done < "$filename"
	
[Bash scripting read file line by line](http://stackoverflow.com/questions/10929453/bash-scripting-read-file-line-by-line)