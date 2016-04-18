" Make sure we run these commands only if we actually have easymotion
" installed
if exists('g:EasyMotion_loaded')
  " Revert to version 1.3 behavior (single leader character to trigger
  " easymotion commands).
  map <Leader> <Plug>(easymotion-prefix)

  " Override <Leader>s behavior by enabling 2-char search à la vim-seek.
  map <Leader>s <Plug>(easymotion-s2)
endif
