return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>fE",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = require("nvim-rooter").get_root() })
			end,
			desc = "Explorer NeoTree (Root Dir)",
		},
		{
			"<leader>fe",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
		{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
	},
	opts = {
		filesystem = {
			window = {
				bind_to_cwd = true,
			},
		},
	},
}
