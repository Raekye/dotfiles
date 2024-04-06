let b:ale_linters = ['analyzer']

" https://rust-analyzer.github.io/manual.html#configuration
" https://rust-analyzer.github.io/manual.html#diagnostics
let b:ale_rust_analyzer_config = {
\	'workspace': {
\		'symbol': {
\ 			'search': {
\ 				'kind': 'all_symbols',
\			},
\		},
\	},
\	'diagnostics': {
\		'disabled': ['remove-unnecessary-else'],
\	},
\}
