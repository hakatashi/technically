module.exports = {
	plugins: [
		[
			'@semantic-release/commit-analyzer',
			{
				preset: 'angular',
				releaseRules: [
					{type: 'chore', release: 'patch'},
					{scope: 'no-release', release: false},
				],
			},
		],
		'@semantic-release/release-notes-generator',
	],
};
