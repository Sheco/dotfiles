-- Debugging
local dap = require("dap")
local function wanted_config(ft)
  -- 1. in-file marker: `dap_default: <name>` in the first 30 lines
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, 30, false)) do
    local name = line:match('dap_default:%s*(.-)%s*$')
    if name and name ~= '' then return name end
  end
  -- 2. project default from .dap_default
  local root = vim.fs.root(0, { '.dap_default', '.git' })
  if root then
    local f = io.open(root .. '/.dap_default', 'r')
    if f then
      local name = vim.trim(f:read('*l') or '')
      f:close()
      if name ~= '' then return name end
    end
  end
end

local function debug_current()
  -- Session already running → just resume (continue/step past breakpoint)
  if dap.session() then
    dap.continue()
    return
  end

  local ft = vim.bo.filetype
  local wanted = wanted_config(ft)
  if wanted then
    for _, cfg in ipairs(dap.configurations[ft] or {}) do
      if cfg.name == wanted then
        dap.run(cfg)
        return
      end
    end
    vim.notify(('No dap config named %q for %s'):format(wanted, ft), vim.log.levels.WARN)
  end
  dap.continue()  -- no marker, no project default, or no match → picker
end

vim.keymap.set("n", "<F5>", function()
  require('dap-view').open()
  debug_current()
end, {  desc="[C]ontinue" })

vim.keymap.set("n", "<F17>", function() -- Shift-F5
  require('dap-view').close()
  dap.close()
end, {  desc="Stop" })

vim.keymap.set("n", "<F9>", function()
  dap.toggle_breakpoint()
end, { desc = "[T]oggle breakpoint" })

vim.keymap.set("n", "<F10>", function()
  dap.step_over()
end, {  desc="Step [O]ver" })

vim.keymap.set("n", "<F11>", function()
  dap.step_into()
end, {  desc="Step [I]nto" })

vim.keymap.set("n", "<F23>", function() -- Shift-F11
  dap.step_out()
end, {  desc="Step o[U]t" })

local lua_pkg = require("mason-registry").get_package("local-lua-debugger-vscode")
local lua_debug_path = lua_pkg:get_install_path().."/extension"

dap.adapters.lua = {
  type = "executable",
  command = "node",
  args = { lua_debug_path.."/extension/debugAdapter.js" },
  enrich_config = function(config, on_config)
    if not config.extensionPath then
      local c = vim.deepcopy(config)
      c.extensionPath = lua_debug_path
      on_config(c)
    else
      on_config(config)
    end
  end,
}

dap.configurations.lua = {
  {
    name = "Launch file",
    type = "lua",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = function()
      return { lua = "lua", file = vim.fn.expand("%:p") }
    end,
    args = function()
      return {}
    end,
  },
  {
    name = "Launch LOVE",
    type = "lua",
    request = "launch",
    cwd = "${workspaceFolder}",
    program = function()
      return { command = "love" }
    end,
    args = function()
      local dir = vim.fn.expand("%:p:h")
      local main = vim.fs.find({ "main.lua" }, { upward = true, path = dir })[1]
      local root = main and vim.fs.dirname(main) or nil

      return { root }
    end,
  },
}

local js_pkg = require("mason-registry").get_package("js-debug-adapter")
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      js_pkg:get_install_path() .."/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end


local python_pkg = require("mason-registry").get_package("debugpy")

dap.adapters.python = function(cb, config)
  if config.request == "attach" then
    local port = (config.connect or config).port
    cb({
      type = "server",
      host = (config.connect or config).host or "127.0.0.1",
      port = assert(port, "`connect.port` is required for a python attach configuration"),
      options = { source_filetype = "python" },
    })
  else
    cb({
      type = "executable",
      command = python_pkg:get_install_path() .. "/venv/bin/python",
      args = { "-m", "debugpy.adapter" },
      options = { source_filetype = "python" },
    })
  end
end

local function python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then return venv .. "/bin/python" end
  local cwd = vim.fn.getcwd()
  for _, p in ipairs({ "/.venv/bin/python", "/venv/bin/python" }) do
    if vim.fn.executable(cwd .. p) == 1 then return cwd .. p end
  end
  return "python3"
end
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch file + args",
    program = "${file}",
    args = function()
      return vim.split(vim.fn.input("Arguments: "), " +")
    end,
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "launch",
    name = "Launch module",
    module = function() return vim.fn.input("Module: ") end,
    pythonPath = python_path,
    cwd = "${workspaceFolder}",
  },
  {
    type = "python",
    request = "attach",
    name = "Attach (remote debugpy)",
    connect = function()
      return { host = "127.0.0.1", port = tonumber(vim.fn.input("Port [5678]: ")) or 5678 }
    end,
  },
}

