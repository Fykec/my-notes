[TOC]

# Installing latest command-line emacs on Mac OS X or any Unix based system

2013-06-25 11:13:17



	curl -O  http://ftp.gnu.org/gnu/emacs/emacs-23.4.tar.gz // 45.5MB
	
	tar -xvzf emacs-23.4.tar.gz
	
	cd emacs*
	
	./configure -without-x
	
	make
	
// see if it works with src/emacs -Q 
	
	sudo make install
 
// replace cur vers of emacs
	
	sudo mv /usr/bin/emacs /usr/bin/emacs.bk
	sudo cp /usr/local/bin/emacs /usr/bin/emacs

[Link](http://readystate4.com/2011/04/19/installing-latest-command-line-emacs-on-mac-os-x/)