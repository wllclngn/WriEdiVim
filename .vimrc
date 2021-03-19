" Write & Edit (v2.1) CODE:
" by wllclngn

" Commands for both *txt and *doc files to auto-call ":WE" when the file-type is opened in Vim.
" autocmd BufNewFile,BufReadPre *.txt :WE
" autocmd BufNewFile,BufReadPre *.doc :WE

func! WriEdi()
  syntax off
  set fo=a tw=80 colorcolumn=80 nonumber noautoindent virtualedit=onemore tabstop=5 shiftwidth=5
  hi StatusLine ctermfg=255 ctermbg=235 cterm=bold
  hi ColorColumn ctermbg=Black
  setlocal statusline=\ \ \ \ \ %F\ \ \ \ \ %M\ %M\ %=L%l\ \ \ \ \ W%{wordcount().words}\ \ \ \ \ %P\ \ \ \ \ 
  inoremap <CR> <CR><CR>
  inoremap " “
  inoremap ." .”
  inoremap ," ,”
  inoremap ?" ?”
  inoremap --" —”
  inoremap "" ”
  inoremap ' ’
  inoremap '' ‘
  inoremap (  ()<left>
  inoremap [  []<left>
  inoremap -- —
  func! ExpDoc()
    %s/\ \ \ \ \ /\t/g
    %s/\n\n/\ \r\r\r\r/g 
    setlocal fo=croql 
    %norm vipJ 
    %s/\ \n\n/\ \r/g 
    %s/\.\ \ /\.\ /g
    %s/\ \ /\ /g
    %s/\t/\ \ \ \ \ /g
    normal gg
  endfu 
  com! ED call ExpDoc()
  func! ImpDoc()
    %s/\n/\ \r\r/g
    %s/\t/\ \ \ \ \ /g
    normal gggqGgg
  endfu 
  com! ID call ImpDoc() 
endfu
com! WE call WriEdi()
