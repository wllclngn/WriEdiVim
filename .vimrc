"Write & Edit (v2.0) CODE:
"by Will Clingan, etal
"
"To be placed directly into a "~/.vimrc" file

autocmd BufNewFile,BufReadPre *.doc :WE

" Write & Edit (v2.0) ":WE"
func! WriEdi()
 setlocal fo=a tw=80 nonumber noautoindent wrap virtualedit=onemore tabstop=5 shiftwidth=5
 hi StatusLine ctermbg=234 cterm=bold
 setlocal statusline=\ \ \ \ \ %t\ \ \ \ \ %P\ \ \ \ \ %{WordCount()}\ \ \ \ \ %M\ %M\ 
 inoremap <CR> <CR><CR>
 " For those wishing to auto-Tab on hitting Enter/Return
 " inoremap <CR> <CR><CR><tab>
 endfu
com! WE call WriEdi()

"WordCount Function setup
"code by Abslom Daak and/or Telemachus
"http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
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
endfunction

" Import Document Function ":ID"
"Reformat/introduce a document for usage in Vim 
"gggqGgg to finalize & return to start of document
func! IndDocFunc()
  %s/\n/\ \r\r/g
  %s/\t/\ \ \ \ \ /g
  normal gggqGgg
endfu 
com! ID call ImpDocFunc() 

" Format Document Function ":FD"
"Commands stacked; replace Vim's inputs w/ styled ones
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

" Export Document Function ":ED"
"Removes hard-wrap, prepares document for usage outside of Vim
func! ExpDocFunc()
  "Three Returns necessary; four Returns to initialize consistently
  %s/\ \ \ \ \ /\t/g
  %s/\n\n/\ \r\r\r\r/g 
  "croql & vipJ by Luke Maciak 
  "http://www.terminally-incoherent.com/blog/2013/06/17/using-vim-for-writing-prose/ 
  setlocal fo=croql 
  %norm vipJ 
  %s/\ \n\n/\ \r/g 
  %s/\t/\ \ \ \ \ /g
  normal gg
endfu 
com! ED call ExpDocFunc()
