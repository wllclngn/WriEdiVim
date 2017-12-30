"Write & Edit (v2.0) CODE:
"by Will Clingan, etal
"
"To be placed directly into a "~/.vimrc" file

autocmd BufNewFile,BufReadPre *.doc :WE
" For those who like .txt files. However, it is recommended to call :WE in the command-line for .txt files.
" autocmd BufNewFile,BufReadPre *.txt :WE

" // Write & Edit ":WE" //
func! WriEdi()
  setlocal fo=a tw=80 nonumber noautoindent virtualedit=onemore tabstop=5 shiftwidth=5
  hi Normal ctermfg=Blue
  hi StatusLine ctermfg=Grey ctermbg=232 cterm=bold
  setlocal statusline=\ \ \ \ \ %F\ \ \ \ \ %M\ %M\ %=W%{WordCount()}\ \ \ \ \ C%c\ \ \ \ \ L%l\ \ \ \ \ %P\ \ \ \ \ 
  inoremap <CR> <CR><CR>
endfu
com! WE call WriEdi()

" // WordCount Function setup //
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

" // Import Document Function ":ID" //
func! ImpDocFunc()
  %s/\n/\ \r\r/g
  %s/\t/\ \ \ \ \ /g
  normal gggqGgg
endfu 
com! ID call ImpDocFunc() 

" // Format Document Function ":FD" //
func! FmtDocFunc()
  %s/--/—/g
  %s/\.\ \ /\.\ /g
  %s/"/“/g 
  %s/\,“/\,”/g
  %s/\.“/\.”/g
  %s/—“/—”/g
  %s/?“/?”/g
  %s/!“/!”/g
  %s/“\ /”\ /g 
  %s/'/’/g
  %s/\[dot\]/●/g
endfu
com! FD call FmtDocFunc()

" // Export Document Function ":ED" //
" // croql & vipJ, Luke Maciak: http://www.terminally-incoherent.com/blog/2013/06/17/using-vim-for-writing-prose/
func! ExpDocFunc()
  %s/\ \ \ \ \ /\t/g
  %s/\n\n/\ \r\r\r\r/g 
  setlocal fo=croql 
  %norm vipJ 
  %s/\ \n\n/\ \r/g 
  %s/\t/\ \ \ \ \ /g
  normal gg
endfu 
com! ED call ExpDocFunc()
