" Write & Edit (v3.0) CODE:
" by wllclngn

" Commands for both *txt and *doc files to auto-call ":WE" when the file-type is opened in Vim.
" autocmd BufNewFile,BufReadPre *.txt :WE
" autocmd BufNewFile,BufReadPre *.doc :WE

func! WriteEdit()
  syntax off
  set fo=a tw=80 nonumber virtualedit onemore noautoindent virtualedit=onemore tabstop=5 shiftwidth=5
  inoremap <CR> <CR><CR>
  inoremap " “
  inoremap ." .”
  inoremap ," ,”
  inoremap ?" ?”
  inoremap --" —”
  inoremap "<Space> ”<Space>
  inoremap ' ’
  inoremap '' ‘
  inoremap -- —
  func! Spelling()
    set spell spelllang=en_us
  endfu 
  com! SP call Spelling()
  func! ExportDoc()
    %s/\ \ \ \ \ /\t/g
    %s/\n\n/\ \r\r\r\r/g 
    setlocal fo=croql 
    vnoremap N J
    %norm vipN 
    %s/\ \n\n/\ \r/g 
    %s/\.\ \ /\.\ /g
    %s/\ \ /\ /g
    %s/\t/\ \ \ \ \ /g
    normal gg
  endfu 
  com! ED call ExportDoc()
  func! ImportDoc()
    %s/\n/\ \r\r/g
    %s/\t/\ \ \ \ \ /g
    normal gggqGgg
  endfu 
  com! ID call ImportDoc()
endfu
com! WE call WriteEdit()
