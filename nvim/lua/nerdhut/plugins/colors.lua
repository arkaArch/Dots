return {
--[[
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "main",
            dark_variant = "main"
        })
        vim.cmd("colorscheme rose-pine")
    end
--]]
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
        require("everforest").setup({
	    -- Default is "medium"
      	    background = "hard",

        })
        vim.cmd("colorscheme everforest")
    end,
}



