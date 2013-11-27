==========
Kill Xcode
==========

.. Author: your_name 
.. title:: this is the real title in Jekyll.
.. |date| date:: 2013-08-30 12:12:06
.. publish:: NO
..  This file is created from ~/.marboo/source/media/file_init/default.init.rst
.. 本文件由 ~/.marboo/source/media/file_init/default.init.rst 复制而来


[Kill XCode](http://agilewarrior.wordpress.com/2012/06/28/how-to-kill-xcode-from-the-command-line/)

	#!/bin/bash
	echo "Killing xcode..."
	kill $(ps aux | grep 'Xcode' | awk '{print $2}')

