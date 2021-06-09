///////////////////////////////////////////////////////////

  <B>COMMANDS:</B>

///////////////////////////////////////////////////////////

<I>"Write & Edit" :WE</I>

Automatically run w/ 'autocmd' for .doc files, feel free to make them for .txt files, etal. Be cautious using for any other file-extension than .doc files as the formatting might cross into programming files unintentionally.

########################

<I>"Export Document" :ED</I>

Removes hard-wraps for soft-wraps, etal, placed onto a file thru ":WE". Prepares a document edited within ":WE" & Vim for usage in a word processor, etc.

########################

<I>"Import Document" :ID</I>

Reformat a document previously used/created in a word processor for usage in ":WE" & Vim.

"normal gggqGgg" is used for text to be properly reconfigured after ":ID" is entered, then cursor placed at start of document.

":ID" is not placed onto a text document automatically for various reasons, most specifically if a document is already properly formatted or accidentally opened in Vim. ":ID" can be easily assimilated into ":WE" if a user wants it to be automatically called, but is not recommended.

Known bug is using ":ED" then using ":ID" on a document in the same session; paragraph text will bleed out of 'tw=80'. The only fix is saving, exiting, reopening, but should almost never be an issue as these commands will likely not be repeatedly stacked in one session.

///////////////////////////////////////////////////////////

  <B>":WE" DETAILS:</B>
  
///////////////////////////////////////////////////////////

Formatting-options ("fo=a") are set so paragraphs are reformatted automatically when text is added, thus paragraphs will not break-up when new text is entered.

Text-width ("tw=80") is set to "80"; traditional appearance of text on printed paper and in word processors.

A "nonumber" and "noautoindent" are called specifically to disable them for programming setups that automatically/already have them running.

A "virtualedit" is called w/ "onemore" so that the cursor may easily be placed beyond periods at the end of a paragraph. This allows for a more familiar user-experience.

A "wrap" is set for continous assistance in wrapping text in Vim.

Tab-keys are set to five-spaces because a traditional Tab-key is unreliable in, say, Microsoft Word, whereas spaces are traditionally reliable across platforms and programs. Five-spaces represent a traditional Tab-key in word processors.

An "inoremap" for two Enters/Returns ("carriage-returns") is called when Enter/Return is pressed due to issues w/ "fo=a" inside of Vim. (Vim's creator, Bram Moolenaar, states "fo=a" is a problem child, which it is, in Vim's tutorial.) If a single-Enter/Return ("carriage-return") is used between two paragraphs, the "carriage-return"/spacing between them will disappear when working on the second paragraph, thus bleeding both paragraphs together. This "inoremap" for "carriage-return" simply helps w/ the "fo=a" issue that bleeds paragraphs together while still allowing a more natural Enter/Return within ":WE".

Further, inoremaps are included to replace formatting properly. Due to special-circumstances, ” & ‘ are called by double-tapping " & ' b/c of their unique usage, ie quoting titles w/out characters like ", . ..." etc. See function's code for better understanding.

///////////////////////////////////////////////////////////

  <B>"lightline.vim" DETAILS:</B>
  
///////////////////////////////////////////////////////////

The modifications for lightline will display current Mode, filename, file's type, file's encoding, "Δ" if the file has unsaved changes, cursor's current column, cursor's current line out of file's entire line count, file's byte count and the file's word count.
