return {
    {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        -- put any other flags you wanted to pass to lazy here!
        config = function()
            require("neorg").setup()
        end,
    }

}
