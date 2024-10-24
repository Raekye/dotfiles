function s:rust_add_import(path)
	call append(0, "use " .. a:path .. ";")
	write
endfunction

command -buffer -nargs=1 RustAddImport call s:rust_add_import(<q-args>)

nn <buffer> <localleader><localleader>i :RustAddImport<space>
