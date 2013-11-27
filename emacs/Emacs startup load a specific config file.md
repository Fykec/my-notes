[TOC]

# Emacs startup load a specific config file

2013-08-29 10:06:54


load remote config
	
	emacs -q --load "/ssh:USER@HOSTNAME:.emacs.d/init.el"
	
load local config

	emacs -q --load "~/simple.emacs.d/init.el" 