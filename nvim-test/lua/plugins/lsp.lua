return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("mason").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "pyright",
                "rust_analyzer",
            },
            handlers = {
                function(server)
                    lspconfig[server].setup({
                        capabilities = capabilities,
                    })
                end,

                clangd = function()
                    lspconfig.clangd.setup({
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--clang-tidy",
                            "--clang-tidy-checks=*",
                            "--completion-style=detailed",
                            "--header-insertion=never",
                            "--checks=misc-const-correctness",
                            "--suggest-missing-includes",
                            "--inlay-hints=true",
                        },
                    })
                end,
            },
        })
    end,
}
