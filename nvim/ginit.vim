lua << EOF
-- NOTE: GUI Options
-------------
-- Nvim-qt --
-------------

if vim.g.GuiLoaded then
  local font_name = "JetBrains Mono"
  local font_size = 11
  local not_transparent = false

  local function toggle_transparency()
    not_transparent = not not_transparent
    if not_transparent then
      vim.cmd("GuiWindowOpacity " .. (0.9))
    else
      vim.cmd("GuiWindowOpacity " .. (1.0))
    end
  end

  vim.keymap.set("n", "<F10>", toggle_transparency, { silent = true })

  local function toggle_fullscreen()
    if vim.g.GuiWindowFullScreen == 0 then
      vim.cmd("call GuiWindowFullScreen(" .. 1 .. ")")
    else
      vim.cmd("call GuiWindowFullScreen(" .. 0 .. ")")
    end
  end

  vim.keymap.set("n", "<F11>", toggle_fullscreen, { silent = true })

  vim.cmd [[
  GuiTabline 0
  GuiPopupmenu 0
  ]]
  vim.cmd("GuiFont! " .. font_name .. ":h" .. font_size)
end

-------------
-- Neovide --
-------------

if vim.g.neovide then
  vim.opt.guifont = "JetBrains Mono:h11"
  vim.g.remember_window_size = true
  vim.g.remember_window_position = true

  -- Initialize transparency if not set
  if vim.g.neovide_transparency == nil then
    vim.g.neovide_transparency = 1.0
  end

  local function toggle_transparency()
    if vim.g.neovide_transparency == 1.0 then
      vim.g.neovide_transparency = 0.8
    else
      vim.g.neovide_transparency = 1.0
    end
    vim.cmd("let g:neovide_transparency=" .. vim.g.neovide_transparency)
  end

  -- Initialize fullscreen if not set
  if vim.g.neovide_fullscreen == nil then
    vim.g.neovide_fullscreen = false
  end

  local function toggle_fullscreen()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    vim.cmd("let g:neovide_fullscreen=" .. tostring(vim.g.neovide_fullscreen))
  end

  vim.keymap.set("n", "<F11>", toggle_fullscreen, { silent = true })
  vim.keymap.set("n", "<F10>", toggle_transparency, { silent = true })
end

-- EOF

