local plugins = {
  --"rose-pine",
  "gruvbox",
  "lualine",
  "nvim-tree",
  "telescope",
  "lsp_config",
  "completion",
  "digraph"
--  "coc"
  -- Aggiungi qui altri plugin
}

for _, plugin in ipairs(plugins) do
  local status, err = pcall(require, "core.plugin_config." .. plugin)
  if not status then
    print("Errore nel caricare " .. plugin .. ": " .. err)
  end
end
