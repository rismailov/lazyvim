return {
    -- themes
    { "catppuccin/nvim" },
    {
        "rebelot/kanagawa.nvim",
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
        },
    },

    -- Setup lazy theme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "kanagawa",
        },
    },
}
