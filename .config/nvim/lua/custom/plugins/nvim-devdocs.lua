return {
  'luckasRanarison/nvim-devdocs',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Dependência obrigatória para async e HTTP
    'nvim-telescope/telescope.nvim', -- Opcional, mas recomendado para busca integrada
    'nvim-treesitter/nvim-treesitter', -- Opcional, melhora parsing de docs
  },
  opts = {
    dir_path = vim.fn.stdpath 'data' .. '/devdocs', -- Diretório para cache de docs (padrão é bom para performance)
    telescope = { wrap_results = true }, -- Integração com Telescope para resultados envolventes
    ensure_installed = { 'go', 'docker', 'kubernetes' }, -- Docs a instalar automaticamente (adicione linguagens que você usa, ex: "python", "rust")
    float_win = { -- Config para janela flutuante
      relative = 'editor',
      height = 25,
      width = 100,
      border = 'rounded',
    },
    wrap = true, -- Quebra linhas longas nas docs
    preview = true, -- Preview ao buscar
    after_open = function(bufnr) -- Hook pós-abertura (opcional: adiciona keymaps customizados)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'q', ':q<CR>', { silent = true })
    end,
  },
  keys = {
    { '<leader>dd', '<cmd>DevdocsOpen<CR>', desc = 'Devdocs: Abrir (Telescope)' },
    { '<leader>df', '<cmd>DevdocsInstall<CR>', desc = 'Devdocs: Instalar Docs' },
    { '<leader>do', '<cmd>DevdocsOpenCurrent<CR>', desc = 'Devdocs: Abrir doc atual' },
    { '<leader>du', '<cmd>DevdocsUpdateAll<CR>', desc = 'Devdocs: Atualizar Docs' },
  },
}
