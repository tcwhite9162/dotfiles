return {

    {
        "folke/neodev.nvim",
        lazy = false,
        config = function()
            require("neodev").setup()
        end,
    },
    {
        "j-hui/fidget.nvim",
        opts = {
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            require("mason").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "texlab", "lua_ls" },
                handlers = {
                    function(server)
                        if server == "lua_ls" then
                            return
                        end
                        lspconfig[server].setup({
                            capabilities = capabilities,
                        })
                    end,

                    lua_ls = function()
                        lspconfig.lua_ls.setup({ capabilities = capabilities })
                    end,

                    clangd = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities,

                            root_dir = require("lspconfig.util").root_pattern(
                                ".git",
                                ".clangd"
                            ),
                            cmd = {
                                "clangd",
                                "--clang-tidy",
                                "--clang-tidy-checks=*",
                                "--completion-style=detailed",
                                "--header-insertion=never",
                                "--checks=misc-const-correctness",
                                "--suggest-missing-includes",
                                "--inlay-hints=false",
                            },
                        })
                    end,

                    texlab = function()
                        lspconfig.texlab.setup({
                            capabilities = capabilities,
                            settings = {
                                texlab = {
                                    formatterLineLength = 50,
                                    latexindent = {
                                        modifyLineBreaks = true,
                                        extraArgs = { "-q" },
                                    },
                                    build = {
                                        executable = "latexmk",
                                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                                        onSave = true,
                                    },
                                    forwardSearch = {
                                        executable = "zathura",
                                        args = { "%p", "%l" },
                                    },
                                    chktex = {
                                        onOpenAndSave = true,
                                        onEdit = false,
                                    },
                                },
                            },
                        })
                    end,
                },
            })
        end,
    },
}
