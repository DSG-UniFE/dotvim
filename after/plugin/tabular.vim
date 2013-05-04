" ******************** TABULAR ********************

" This configuration was taken from vimcasts.org (episode 29)

" To align text using Tabular:
" :Tabularize /{pattern}
" (also remember to use \zs, a special pattern that captures the first
" character after the matched text)
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
