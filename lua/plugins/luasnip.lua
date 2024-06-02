return {
    "L3MON4D3/LuaSnip",
    opts = {
        update_events = { "TextChanged", "TextChangedI" },
        enable_autosnippets = true,
    },
    config = function()
        local ls = require("luasnip")

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, { silent = true, desc = "LuaSnip: Jump forward" })

        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, { silent = true, desc = "LuaSnip: Jump backward" })

        vim.keymap.set("i", "<c-l>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { desc = "LuaSnip: Switch choice" })
    end,
}
