{application, 'advent_of_code_22', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['advent_of_code_22_app','advent_of_code_22_sup','day_1','helpers']},
	{registered, [advent_of_code_22_sup]},
	{applications, [kernel,stdlib]},
	{mod, {advent_of_code_22_app, []}},
	{env, []}
]}.