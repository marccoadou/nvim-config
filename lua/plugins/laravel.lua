return {
    {
        "adalessa/laravel.nvim",
        dependencies = {
            "tpope/vim-dotenv",
            "nvim-telescope/telescope.nvim",
            "MunifTanjim/nui.nvim",
            "kevinhwang91/promise-async"
        },
        cmd = {"Laravel"},
        keys = {
            {"<leader>la", ":Laravel artisan<cr>"},
            {"<leader>lr", ":Laravel routes<cr>"},
            {"<leader>lm", ":Laravel related<cr>"}
        },
        event = {"VeryLazy"},
        config = true,
    },
      {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.pint.with({
          command = "./vendor/bin/pint", -- Use Pint from your local vendor folder
        }),
      },
    })
  end,
},
    {
        -- Add a Treesitter parser for Laravel Blade to provide Blade syntax highlighting.
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(
                opts.ensure_installed,
                {
                    "blade",
                    "php_only",
                    "html",
                    "javascript"
                }
            )
        end,
        config = function(_, opts)
            vim.filetype.add(
                {
                    pattern = {
                        [".*%.blade%.php"] = "blade"
                    }
                }
            )

            require("nvim-treesitter.configs").setup(opts)
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = {"src/parser.c"},
                    branch = "main"
                },
                filetype = "blade"
            }
        end
    },
    {
        -- Add the blade-nav.nvim plugin which provides Goto File capabilities
        -- for Blade files.
        "ricardoramirezr/blade-nav.nvim",
        dependencies = {
            "hrsh7th/nvim-cmp"
        },
        ft = {"blade", "php"}
    }
}

