return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function ()
            require("ibl").setup()
        end
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.opt.termguicolors = true
            require('nvim-tree').setup({
                view = {
                    width = 30,
                }
            })
            vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<cr>', {})
            vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<cr>', {})
        end
    },

        {
            'nvim-telescope/telescope.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons'
            },
            config = function()
                require('telescope').setup({
                    defaults = {
                        layout_config = {
                            horizontal = {
                                width = .9,
                                preview_width = .7
                            }
                        }
                    }
                })
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
            end
        },
        {
            'akinsho/bufferline.nvim',
            config = function()
                require("bufferline").setup{}
            end
        },
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end
        },

        {
            'nvim-lualine/lualine.nvim',
            config = function()
                require('lualine').setup()
            end
        },

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require'nvim-treesitter.configs'.setup {
                    ensure_installed = {
                        "css", "scss", "html", "javascript", -- for vue components
                        "c", "lua", "vim", "vimdoc", "ruby", "bash",
                        "python"
                    },
                    sync_install = false,
                    auto_install = true,
                    highlight = {
                        enable = true,
                        additional_vim_regex_highlighting = false,
                    },
                    indent = {
                        enable = true,
                    }
                }
            end
        }
    }
