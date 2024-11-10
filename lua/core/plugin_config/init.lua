local plugins = {
  --"rose-pine",
  "gruvbox",
  "lualine",
  "nvim-tree",
  "telescope",
  "lsp_config",
  "completion"
--  "coc"
  -- Aggiungi qui altri plugin
}

for _, plugin in ipairs(plugins) do
  local status, err = pcall(require, "core.plugin_config." .. plugin)
  if not status then
    print("Errore nel caricare " .. plugin .. ": " .. err)
  end
end

--require("core.plugin.config.rose-pine")
--require("core.plugin_config.harpoon")
--require("core.plugin_config.lualine")
--require("core.plugin_config.nvim-tree")
--require("core.plugin_config.telescope")
--require("core.plugin_config.treesitter")
--require("core.plugin_config.fugitive")
--require("core.plugin_config.undotree")
--require("core.plugin.config.trouble")

