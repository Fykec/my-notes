[TOC]

# Removing untracked files from your git working copy

2013-06-25 11:08:45


	git clean -f

If you want to also remove directories, run 

	git clean -f -d.

If you just want to remove ignored files, run 
	
	git clean -f -X.

If you want to remove ignored as well as non-ignored files, run 

	git clean -f -x.

Note the case difference on the X for the two latter commands.

If clean.requireForce is set to "true" (the default) in your configuration, then unless you specify -f nothing will actually happen, with a recent enough version of git.

Note that as of git-1.6.0, the dashed style of writing git commands (ie, git-clean instead of git clean) is obsoleted.

See the git-clean docs for more information.
[Link](http://stackoverflow.com/questions/61212/removing-untracked-files-from-your-git-working-copy)