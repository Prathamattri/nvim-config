return {
  'lervag/vimtex',
  lazy = false, -- don't lazy-load VimTeX
  init = function()
    -- configure VimTeX here, e.g.
    vim.g.vimtex_view_method = 'zathura'
  end,
}
