-- nice bar at the bottom
return {
	"nvim-lualine/lualine.nvim",
	lazy = false, -- also load at start since it's UI
    enabled = false,
	opts = {
		options = {
			theme = "dracula",
		},
	},
}