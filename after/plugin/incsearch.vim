" Make sure we run these commands only if we actually have incsearch installed
if exists('g:loaded_incsearch')

  " Check if we have the incsearch-easymotion.vim integration plugin and
  " configure incsearch accorgingly.
  if exists('g:loaded_incsearch_easymotion')
    " We have incsearch-easymotion.vim, so we configure incsearch to trigger
    " easymotion integration when the user inserts <C-l>. We use <C-l> (as
    " opposed to CR>) because we want to use easymotion integration only
    " occasionally.
    function! s:incsearch_config(...) abort
      return incsearch#util#deepextend(deepcopy({
      \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
      \   'keymap': {
      \     "\<C-l>": '<Over>(easymotion)'
      \   },
      \   'is_expr': 0
      \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
    noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
    noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
  else
    " We don't have incsearch-easymotion.vim, so we setup the incsearch.vim
    " default mappings.
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
  endif " g:loaded_incsearch_easymotion

  " Setup automatic nohlsearch
  " (For more information, refer to :h g:incsearch#auto_nohlsearch)
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

endif " g:loaded_incsearch
