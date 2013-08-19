if exists(":AirlineToggle")
  set laststatus=2 " Use 2 lines for the statusbar
  let g:airline_theme='dark'
  let g:airline_detect_paste=1
  " let g:airline_enable_syntastic=1

  " enable powerline symbols
  let g:airline_powerline_fonts=1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_branch_prefix = ' '
  let g:airline_readonly_symbol = ''
  let g:airline_linecolumn_prefix = ' '
endif
