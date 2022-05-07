vim.g.mapleader = " "

local mapping = {}

mapping.register = function(range, gruop_name, bufnr)
    local group_keymap = mapping[range][gruop_name]
    for _, key_map in ipairs(group_keymap) do
        -- noremap : default = true
        local options = {
            buffer = bufnr
        }
        if key_map[4] then
            for opt in vim.gsplit(key_map[4], "|", true) do
                options[opt] = true
            end
        end
        vim.keymap.set(key_map[1], key_map[2], key_map[3], options)
    end
end

mapping.global = {
    basic = {
        {{"i"}, "jj", "<esc>", "silent"},
        {{"t"}, "<esc>", "<c-\\><c-n>", "silent"},
        {{"n"}, "\\\\", ":qa!<cr>", "silent"},
        {{"n"}, "<esc>", ":nohlsearch<cr>", "silent"},
        {{"n"}, "<c-u>", "12k", "silent"},
        {{"n"}, "<c-d>", "12j", "silent"},
        {{"n"}, "<m-k>", "<c-w>-", "silent"},
        {{"n"}, "<m-j>", "<c-w>+", "silent"},
        {{"n"}, "<m-h>", "<c-w><", "silent"},
        {{"n"}, "<m-l>", "<c-w>>", "silent"},
        {{"n"}, "<leader>cs", "<cmd>set spell!<cr>", "silent"},
        {{"i", "c", "t"}, "<m-w>", "<c-right>"},
        {{"i", "c", "t"}, "<m-b>", "<c-left>"},
        {{"i", "c", "t"}, "<m-k>", "<up>"},
        {{"i", "c", "t"}, "<m-j>", "<down>"},
        {{"i", "c", "t"}, "<m-h>", "<left>"},
        {{"i", "c", "t"}, "<m-l>", "<right>"},
        {
            {"n", "x"},
            "j",
            function()
                return vim.v.count > 0 and "j" or "gj"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "k",
            function()
                return vim.v.count > 0 and "k" or "gk"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "H",
            function()
                return vim.v.count > 0 and "^" or "g^"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "L",
            function()
                return vim.v.count > 0 and "$" or "g$"
            end,
            "silent|expr"
        }
    },
    nvim_tree = {
        {{"n"}, "<leader>1", "<cmd>NvimTreeToggle<cr>", "silent"},
        {{"n"}, "<leader>fc", "<cmd>NvimTreeFindFile<cr>", "silent"}
    },
    vim_dadbod_ui = {
        {{"n"}, "<leader>4", ":DBUIToggle<cr>", "silent"}
    },
    neoformat = {
        {{"n"}, "<leader>cf", "<cmd>Neoformat<cr>", "silent"}
    },
    switch = {
        {{"n"}, "gs", ":Switch<cr>", "silent"}
    },
    vim_vsnip = {
        {{"i", "s"}, "<s-tab>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "expr|silent"},
        {{"i", "s"}, "<tab>", "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'", "expr|silent"}
    },
    hop = {
        {{"n", "v"}, "ss", "<cmd>HopWord<cr>", "silent"},
        {{"n", "v"}, "sl", "<cmd>HopLine<cr>", "silent"},
        {{"n", "v"}, "sc", "<cmd>HopChar1<cr>", "silent"}
    },
    toggleterm = {
        {{"n"}, "<leader>tt", "<cmd>lua require('toggleterm').term_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tv", "<cmd>lua require('toggleterm').vertical_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<cr>", "silent"},
        {{"n"}, "<leader>ta", "<cmd>lua require('toggleterm').toggle_all_term()<cr>", "silent"}
    },
    bufferline = {
        {{"n"}, "<c-q>", "<cmd>Bdelete!<cr>", "silent"},
        {{"n"}, "<c-h>", "<cmd>BufferLineCyclePrev<cr>", "silent"},
        {{"n"}, "<c-l>", "<cmd>BufferLineCycleNext<cr>", "silent"},
        {{"n"}, "<c-e>", "<cmd>BufferLineMovePrev<cr>", "silent"},
        {{"n"}, "<c-y>", "<cmd>BufferLineMoveNext<cr>", "silent"},
        {{"n"}, "<leader>th", "<cmd>BufferLineCloseLeft<cr>", "silent"},
        {{"n"}, "<leader>tl", "<cmd>BufferLineCloseRight<cr>", "silent"},
        {{"n"}, "<leader>to", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "silent"},
        {{"n"}, "<leader>t1", "<cmd>BufferLineGoToBuffer 1<cr>", "silent"},
        {{"n"}, "<leader>t2", "<cmd>BufferLineGoToBuffer 2<cr>", "silent"},
        {{"n"}, "<leader>t3", "<cmd>BufferLineGoToBuffer 3<cr>", "silent"},
        {{"n"}, "<leader>t4", "<cmd>BufferLineGoToBuffer 4<cr>", "silent"},
        {{"n"}, "<leader>t5", "<cmd>BufferLineGoToBuffer 5<cr>", "silent"},
        {{"n"}, "<leader>t6", "<cmd>BufferLineGoToBuffer 6<cr>", "silent"},
        {{"n"}, "<leader>t7", "<cmd>BufferLineGoToBuffer 7<cr>", "silent"},
        {{"n"}, "<leader>t8", "<cmd>BufferLineGoToBuffer 8<cr>", "silent"},
        {{"n"}, "<leader>t9", "<cmd>BufferLineGoToBuffer 9<cr>", "silent"},
        {{"n"}, "<leader>tt", "<cmd>BufferLinePick<cr>", "silent"},
        {{"n"}, "<leader>ts", "<cmd>BufferLineSortByExtension<cr>", "silent"}
    },
    packer = {
        {{"n"}, "<leader>ps", "<cmd>PackerSync<cr>", "silent"},
        {{"n"}, "<leader>pS", "<cmd>PackerStatus<cr>", "silent"},
        {{"n"}, "<leader>pc", "<cmd>PackerClean<cr>", "silent"},
        {{"n"}, "<leader>pu", "<cmd>PackerUpdate<cr>", "silent"},
        {{"n"}, "<leader>pi", "<cmd>PackerInstall<cr>", "silent"},
        {{"n"}, "<leader>pr", "<cmd>PackerCompile<cr>", "silent"}
    },
    nvim_notify = {
        {
            {"n"},
            "<leader>fn",
            "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    },
    telescope = {
        {
            {"n"},
            "<leader>ff",
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fg",
            "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fo",
            "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fh",
            "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>ft",
            "<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fm",
            "<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fi",
            "<cmd>lua require('telescope.builtin').highlights(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fb",
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fp",
            "<cmd>lua require('telescope.builtin').pickers(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>f/",
            "<cmd>lua require('telescope.builtin').search_history(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>f:",
            "<cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    }
}
mapping.buffer = {
    nvim_lsp_installer = {
        {
            {"n"},
            "gd",
            "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "gr",
            "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "go",
            "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>ca",
            "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {{"n"}, "gh", "<cmd>Lspsaga hover_doc<cr>", "silent"},
        {{"n"}, "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "silent"},
        {{"n"}, "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", "silent"},
        {{"n"}, "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", "silent"},
        {{"n"}, "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", "silent"},
        {{"n"}, "<leader>cn", "<cmd>Lspsaga rename<cr>", "silent"}
    },
    aerial = {
        {{"n"}, "<leader>2", "<cmd>AerialToggle! right<cr>", "silent"},
        {{"n"}, "{", "<cmd>AerialPrev<cr>", "silent"},
        {{"n"}, "}", "<cmd>AerialNext<cr>", "silent"},
        {{"n"}, "[[", "<cmd>AerialPrevUp<cr>", "silent"},
        {{"n"}, "]]", "<cmd>AerialNextUp<cr>", "silent"}
   },
    gitsigns = {
        {{"n"}, "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", "expr|silent"},
        {{"n"}, "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", "expr|silent"},
        {{"n"}, "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "silent"},
        {{"n"}, "<leader>gh", "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>", "silent"},
        {{"n"}, "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", "silent"},
        {{"n"}, "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", "silent"},
        {{"n"}, "<leader>gv", "<cmd>Gitsigns diffthis<cr>", "silent"},
        {{"n", "v"}, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "silent"}
    }
}
mapping.plugin = {
    lsp_signature = {
        toggle_key = "<c-j>"
    },
    lspsaga = {
        quit = "<esc>",
        exec = "<cr>"
    },
    telescope_buffer = {
        insert_del_buf = "<c-d>",
        noremal_del_buf = "dd"
    },
    nvim_cmp = {
        prev_item = "<c-p>",
        next_item = "<c-n>",
        confirm = "<cr>",
        next_item_or_confirm = "<tab>",
        prev_5_item = "<c-u>",
        next_5_item = "<c-d>",
        toggle_complete = "<c-k>",
        prev_scroll = "<c-b>",
        next_scroll = "<c-f>"
    },
    nvim_treesitter = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        node_decremental = "<bs>",
        scope_incremental = "<tab>"
    },
    comment = {
        normal_line_toggle = "gcc",
        normal_block_toggle = "gCC",
        normal_prev_rows = "gcO",
        normal_next_rows = "gco",
        noremal_end_line = "gcA",
        visual_line_toggle = "gc",
        visual_block_toggle = "gC"
    },
    toggleterm = {
        exit_insert = "<esc>",
        lazy_git_exit_insert = "q",
        float_exit_insert = "<esc>"
    }
}
return mapping
