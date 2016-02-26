if exists('g:loaded_smartword')

  " Replace |w| and other motions with smartword mappings:
  map w  <Plug>(smartword-w)
  map b  <Plug>(smartword-b)
  map e  <Plug>(smartword-e)
  map ge  <Plug>(smartword-ge)

  " Keep the default meanings of |w| and others in other key sequences:
  " noremap ,w  w
  " noremap ,b  b
  " noremap ,e  e
  " noremap ,ge  ge

endif
