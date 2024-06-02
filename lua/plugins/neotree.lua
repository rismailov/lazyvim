return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            window = {
                mappings = {
                    ["o"] = "open",
                    -- need to disable submappings of "o" so it works without delay
                    -- video: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1386
                    -- explanation: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/1345#discussioncomment-8397983
                    ["oc"] = "noop",
                    ["od"] = "noop",
                    ["og"] = "noop",
                    ["om"] = "noop",
                    ["on"] = "noop",
                    ["os"] = "noop",
                    ["ot"] = "noop",
                },
            },
        },
    },
}
