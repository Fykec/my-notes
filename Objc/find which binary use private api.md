# find which binary use private api

2013-05-15 12:10:31


	find . | grep -v .svn  | grep "\.a" | grep -v "\.app" | xargs grep uniqueIdentifier


another better one
	
	grep -Rnis 'uniqueIdentifier' *

[App rejected, but I don't use UDID](http://stackoverflow.com/questions/16409966/app-rejected-but-i-dont-use-udid)