let b:ale_linters = ['analyzer']

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
