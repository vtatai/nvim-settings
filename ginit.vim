function! s:VimRTempMaxWin() abort
  VimRMakeSessionTemporary    " The tools, tool buttons and window settings are not persisted
  VimRHideTools
  VimRMaximizeWindow
endfunction
command! -nargs=0 VimRTempMaxWin call s:VimRTempMaxWin()
