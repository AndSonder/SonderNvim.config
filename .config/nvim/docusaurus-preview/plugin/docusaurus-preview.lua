if vim.g.loaded_docusaurus_preview then
  return
end
vim.g.loaded_docusaurus_preview = true

vim.api.nvim_create_user_command("DocusaurusPreview", function()
  require("docusaurus-preview").open()
end, { desc = "Preview the current Markdown file with Docusaurus" })

vim.schedule(function()
  require("docusaurus-preview").warm()
end)
