local mason_status, mason = pcall(require, "mason")
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_status then
    vim.notify("Problem with mason")
    return
end
if not mason_lspconfig_status then
    vim.notify("Problem with mason-lspconfig")
    return
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "omnisharp", "clangd", "hls" },
    automatic_installation = true,
})


vim.opt.spell = false
vim.opt.updatetime = 200

vim.diagnostic.config({
    virtual_text = false,  -- Disabilita il testo virtuale sulla riga
    signs = true,          -- Mostra segni a lato della linea
    underline = true,      -- Sottolinea la linea con errori o warning
    update_in_insert = false, -- Non mostrare in modalità insert
    severity_sort = true,  -- Ordina le diagnosi per gravità
    float = {
        show_header = true,
        source = "always",  -- Mostra sempre la fonte del messaggio
        border = "rounded",
        focusable = false,  -- La finestra di popup non prende il focus
    },
})

-- Apri una finestra di popup per il messaggio diagnostico quando il cursore si ferma su una riga
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = true })
    end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configura la diagnostica globale in Neovim per ignorare errori nei commenti
require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }, -- Aggiungi 'vim' per evitare il warning di variabile globale
            },
        },
    },
}

require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end,
}

require("lspconfig").hls.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
}

require("lspconfig").omnisharp.setup {
    cmd = { "dotnet", "/home/victor/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
    capabilities = capabilities,
    settings = {
      FormattingOptions = {
        -- Enables support for reading code style, naming convention and analyzer
        -- settings from .editorconfig.
        EnableEditorConfigSupport = true,
        -- Specifies whether 'using' directives should be grouped and sorted during
        -- document formatting.
        OrganizeImports = nil,
      },
      MsBuild = {
        -- If true, MSBuild project system will only load projects for files that
        -- were opened in the editor. This setting is useful for big C# codebases
        -- and allows for faster initialization of code navigation features only
        -- for projects that are relevant to code that is being edited. With this
        -- setting enabled OmniSharp may load fewer projects and may thus display
        -- incomplete reference lists for symbols.
        LoadProjectsOnDemand = nil,
      },
      RoslynExtensionsOptions = {
        -- Enables support for roslyn analyzers, code fixes and rulesets.
        EnableAnalyzersSupport = nil,
        -- Enables support for showing unimported types and unimported extension
        -- methods in completion lists. When committed, the appropriate using
        -- directive will be added at the top of the current file. This option can
        -- have a negative impact on initial completion responsiveness,
        -- particularly for the first few completion sessions after opening a
        -- solution.
        EnableImportCompletion = nil,
        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
        -- true
        AnalyzeOpenDocumentsOnly = nil,
      },
      Sdk = {
        -- Specifies whether to include preview versions of the .NET SDK when
        -- determining which version to use for project loading.
        IncludePrereleases = true,
      },
    },
}
