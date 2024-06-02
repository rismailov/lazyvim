return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            --
            "css",
            "comment",
        },
        indent = {
            enable = true,
            -- https://www.reddit.com/r/neovim/comments/vqrg7w/weird_indentation_issue_with_neovim_in_rust/
            -- https://github.com/ChristianChiarulli/nvim/blob/0bb44e43b34d1859e971dcac8d29f7c07da4bbc6/lua/user/treesitter.lua#L23
            disable = { "python", "rust", "css" },
        },
    },
}
