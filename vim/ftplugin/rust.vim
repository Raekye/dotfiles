let b:ale_linters = ['analyzer']

" https://rust-analyzer.github.io/book/configuration.html
" https://rust-analyzer.github.io/book/diagnostics.html
let b:ale_rust_analyzer_config = {
\	'workspace': {
\		'symbol': {
\ 			'search': {
\ 				'kind': 'all_symbols',
\			},
\		},
\	},
\	'diagnostics': {
\		'disabled': [
\			'remove-unnecessary-else',
\			'unlinked-file',
\		],
\	},
\}
