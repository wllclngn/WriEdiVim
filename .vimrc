" Write & Edit (v2.1) CODE:
" by Will Clingan, etal

" Commands for both *txt and *doc files to auto-call ":WE" when the file-type is opened in Vim.
" autocmd BufNewFile,BufReadPre *.txt :WE
" autocmd BufNewFile,BufReadPre *.doc :WE

" // Write & Edit ":WE" //
func! WriEdi()
  syntax off
  set fo=a tw=80 colorcolumn=80 nonumber noautoindent virtualedit=onemore tabstop=5 shiftwidth=5
  hi StatusLine ctermfg=255 ctermbg=235 cterm=bold
  hi ColorColumn ctermbg=Black
  setlocal statusline=\ \ \ \ \ %F\ \ \ \ \ %M\ %M\ %=C%c\ \ \ \ \ L%l\ \ \ \ \ W%{WordCount()}\ \ \ \ \ %P\ \ \ \ \ 
  " // Abslom Daak || Telemachus: http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
  function! WordCount()
    let s:old_status = v:statusmsg
    let position = getpos(".")
    exe ":silent normal g\<c-g>"
    let stat = v:statusmsg
    let s:word_count = 0
    if stat != '--No lines in buffer--'
      let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
    end
    call setpos('.', position)
    return s:word_count
  endfu
  inoremap <CR> <CR><CR>
  inoremap "" “”<left>
  inoremap '' ‘’<left>
  inoremap ' ’
  inoremap (  ()<left>
  inoremap [  []<left>
  inoremap -- —
  " // croql & vipJ, Luke Maciak: http://www.terminally-incoherent.com/blog/2013/06/17/using-vim-for-writing-prose/
  func! ExpDocFunc()
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
  com! ED call ExpDocFunc()
  func! ImpDocFunc()
    %s/\n/\ \r\r/g
    %s/\t/\ \ \ \ \ /g
    normal gggqGgg
  endfu 
  com! ID call ImpDocFunc() 
endfu
com! WE call WriEdi()
