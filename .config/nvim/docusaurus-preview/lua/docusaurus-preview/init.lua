local M = {}

local plugin_root = vim.fs.dirname(vim.fs.dirname(vim.fs.dirname(debug.getinfo(1, "S").source:sub(2))))
local preview_script = plugin_root .. "/preview.sh"
local log_file = plugin_root .. "/preview.log"

local function start_preview(open_browser)
  if vim.bo.filetype ~= "markdown" then
    return
  end

  local source_file = vim.api.nvim_buf_get_name(0)
  if source_file == "" then
    if open_browser then
      vim.notify("Save the Markdown file before opening its preview", vim.log.levels.WARN)
    end
    return
  end

  if open_browser then
    vim.cmd.write()
  end

  local job_id = vim.fn.jobstart({ preview_script, source_file, open_browser and "yes" or "no" }, { detach = true })

  if job_id <= 0 and open_browser then
    vim.notify("Unable to start Docusaurus preview; see " .. log_file, vim.log.levels.ERROR)
  end
end

function M.open()
  start_preview(true)
end

function M.warm()
  start_preview(false)
end

return M
