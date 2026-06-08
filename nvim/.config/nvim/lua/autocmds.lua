local autocmd = vim.api.nvim_create_autocmd

-- Abre o NvimTree automaticamente se o Neovim for aberto em um diretório (ex: nvim .)
autocmd("VimEnter", {
  callback = function(data)
    -- Verifica se o argumento passado (data.file) é um diretório
    local is_directory = vim.fn.isdirectory(data.file) == 1
    if not is_directory then
      return
    end

    -- Muda o diretório de trabalho do Neovim para a pasta atual
    vim.cmd.cd(data.file)

    -- Abre o nvim-tree
    require("nvim-tree.api").tree.open()
  end,
})
