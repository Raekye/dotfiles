if b:eruby_subtype == 'html'
	" The ftplugin eruby.vim sources ruby.vim with a line like:
	" runtime! ftplugin/ruby.vim ftplugin/ruby_*.vim ftplugin/ruby/*.vim
	" Undoes the (corresponding) options in ruby.vim.
	setlocal noexpandtab shiftwidth=4 softtabstop=4
endif
