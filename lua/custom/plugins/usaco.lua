return { {
	'xeluxee/competitest.nvim',
	keys = {
		{ "<leader>R", "<cmd>CompetiTest receive problem<cr>", desc = "Receive competitest problems" },
		{ "<leader>r", "<cmd>CompetiTest run<cr>",             desc = "Run competitest problem" },
		-- $(JAVA_TASK_CLASS)
	},
	dependencies = 'MunifTanjim/nui.nvim',
	lazy = false,
	config = function()
		require('competitest').setup {
			local_config_file_name = ".competitest.lua",


			save_current_file = true,
			save_all_files = false,
			compile_directory = ".",
			compile_command = {
				c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
				cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
				rust = { exec = "rustc", args = { "$(FNAME)" } },
				java = { exec = "javac", args = { "$(FNAME)" } },
			},
			running_directory = ".",
			run_command = {
				c = { exec = "./$(FNOEXT)" },
				cpp = { exec = "./$(FNOEXT)" },
				rust = { exec = "./$(FNOEXT)" },
				python = { exec = "python", args = { "$(FNAME)" } },
				java = { exec = "java", args = { "$(FNOEXT)" } },
			},
			multiple_testing = -1,
			maximum_time = 5000,
			output_compare_method = "squish",
			view_output_diff = false,

			testcases_directory = ".",
			testcases_use_single_file = false,
			testcases_auto_detect_storage = true,
			testcases_single_file_format = "$(FNOEXT).testcases",
			testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
			testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

			companion_port = 27121,
			receive_print_message = true,
			template_file = false,
			evaluate_template_modifiers = false,
			date_format = "%c",
			received_files_extension = "cpp",
			received_problems_path = "$(CWD)/$(JAVA_TASK_CLASS).$(FEXT)",
			received_problems_prompt_path = true,
			received_contests_directory = "$(CWD)",
			received_contests_problems_path = "$(JAVA_TASK_CLASS).$(FEXT)",
		}
	end
} }
