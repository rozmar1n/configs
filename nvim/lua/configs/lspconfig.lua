require("nvchad.configs.lspconfig").defaults()

local function has_file(path)
  return vim.uv.fs_stat(path) ~= nil
end

local function pick_compile_commands_dir(root_dir)
  local candidates = {
    root_dir .. "/build",
    root_dir .. "/frontend/build",
    root_dir .. "/cmake-build-debug",
    root_dir .. "/cmake-build-release",
  }

  for _, dir in ipairs(candidates) do
    if has_file(dir .. "/compile_commands.json") then
      return dir
    end
  end

  return nil
end

local function make_clangd_cmd(root_dir)
  local cmd = {
    "clangd",
    "--background-index",
    "--enable-config",
  }

  local cc_dir = pick_compile_commands_dir(root_dir)
  if cc_dir then
    table.insert(cmd, "--compile-commands-dir=" .. cc_dir)
  end

  return cmd
end

vim.lsp.config("clangd", {
  cmd = make_clangd_cmd(vim.fn.getcwd()),
  on_new_config = function(new_config, root_dir)
    new_config.cmd = make_clangd_cmd(root_dir)

    new_config.init_options = new_config.init_options or {}
    new_config.init_options.fallbackFlags = {
      "-std=gnu++20",
      "-I" .. root_dir .. "/include",
      "-I" .. root_dir .. "/frontend/include",
    }
  end,
})

local servers = { "html", "cssls", "clangd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
