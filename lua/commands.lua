local configFolder = vim.fn.stdpath "config"
-- Step 1: List all files in the directory using OS-specific commands
local function listFilesInDirectory(directory)
  local command
  if package.config:sub(1, 1) == "\\" then
    -- Windows: Use 'dir' command
    command = string.format('dir "%s" /b', directory)
  else
    -- Unix-like systems: Use 'ls' command
    command = string.format('ls "%s"', directory)
  end

  local handle = io.popen(command)
  if not handle then
    error "Failed to execute directory listing command"
  end

  local result = handle:read "*a" -- Read the entire output
  handle:close()

  -- Split the result into individual file names
  local files = {}
  for file in result:gmatch "[^\r\n]+" do
    if file ~= "." and file ~= ".." and file ~= "out" and file ~= "disabled" then
      table.insert(files, file)
    end
  end

  return files
end

-- Step 2: Process each plugin file

local function processPlugins()
  local luaPluginsCombine = ""
  local luaPlugins = listFilesInDirectory (configFolder .. "/lua/plugins")

  for _, luaPlugin in ipairs(luaPlugins) do
    local filePath = configFolder.."/lua/plugins/" .. luaPlugin
    local file = io.open(filePath, "r")
    if file then
      local lines = {}
      for line in file:lines() do
        table.insert(lines, line)
      end
      file:close()

      -- Remove the first and last lines
      if #lines > 2 then
        table.remove(lines, 1) -- Remove first line
        table.remove(lines) -- Remove last line
      end

      -- Append the processed content to the combined string
      luaPluginsCombine = luaPluginsCombine .. table.concat(lines, "\n") .. "\n"
    end
  end
  return luaPluginsCombine
end

-- Step 3: Write the combined content to the output file
local function reloadPlugins()
  -- remove the file if it exists
  os.remove(configFolder .. "/lua/plugins/out/plugins.lua")

  -- create the file
  local outputFile = io.open(configFolder .. "/lua/plugins/out/plugins.lua", "w")

  if outputFile then
    outputFile:write("return {\n" .. processPlugins() .. "\n}")
    outputFile:close()
  end
end

vim.api.nvim_create_user_command("PluginsReload", function()
  local notify = vim.notify("Reloading plugins...")
  reloadPlugins()
  vim.notify("Reloaded plugins!", "info", { replace = notify })
end, { desc = "Reload plugins" })
