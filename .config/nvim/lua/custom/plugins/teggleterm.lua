return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 12, -- Tamanho do terminal
      open_mapping = [[<leader>t]], -- Atalho para abrir/fechar
      direction = 'float', -- Pode ser 'float', 'vertical', 'horizontal'
      float_opts = { border = 'curved' }, -- Estilo do popup (se usar float)
    }
  end,
}
