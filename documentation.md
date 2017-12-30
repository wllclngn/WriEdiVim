///////////////////////////////////////////////////////////

  <B>COMMANDS:</B>

///////////////////////////////////////////////////////////

<B>"Write & Edit" :WE</B>

Automatically run w/ 'autocmd' for .doc files, feel free to make them for .txt files, etal

Only ":ED" is necessary if you want to work on a document outside of ":WE" & Vim

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

<B>"Import Document" :ID</B>

Reformat a document previously used/created in a word processor for usage in ":WE" & Vim

"normal gggqGgg" is used for text to be properly reconfigured after ":ID" is entered, then cursor placed at start of document

":ID" is not placed onto a text document automatically for various reasons, most specifically if a document is already properly formatted or accidentally opened in Vim; can be easily assimilated into ":WE" (most easily called by function-name on ":WE"'s final line due to command stacking) if a user wants it to be automatically called

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

<B>"Format Document" :FD</B>

Replace Vim's inputs (comma, question-mark, etal) w/ styled ones, cleans up document when sometimes beat-up w/ "fo=a" as discussed later

Commands are stacked, be careful if adding your own

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

<B>"Export Document" :ED</B>

Removes hard-wraps for soft-wraps, etal

Prepares a document edited within ":WE" & Vim for usage in a word processor, etc.

///////////////////////////////////////////////////////////

  <B>":WE" DETAILS:</b>
  
///////////////////////////////////////////////////////////

Within ":WE" the following is setup:

Formatting-options ("fo=a") are set so paragraphs are reformatted automatically when text is added, thus paragraphs will not break-up when new text is entered.

Text-width ("tw=80") is set to "80"; traditional appearance of text on printed paper and in word processors.

A "nonumber" and "noautoindent" are called specifically to disable them for programming setups that automatically/already have them running.

A "virtualedit" is called w/ "onemore" so that the cursor may easily be placed beyond periods at the end of a paragraph. This allows for a more familiar user-experience.

A "wrap" is set for continous assistance in wrapping text in Vim.

Tab-keys are set to five-spaces because a traditional Tab-key is unreliable in, say, Microsoft Word, whereas spaces are traditionally reliable across platforms and programs. Five-spaces represent a traditional Tab-key in word processors.

The status-line setup shows the file's path and name, "+ +" if the document has been edited, word count, column number, line number and the window's view of a document in percentage.

Further setup changes the color of the statusline to a dark-color with grey text as to lessen hindrance when writing and editing. This also provides a visual cue that one has entered ":WE" successfully.

An "inoremap" for two Enters/Returns ("carriage-returns") is called when Enter/Return is pressed due to issues w/ "fo=a" inside of Vim. (Vim's creator, Bram Moolenaar, states "fo=a" is a problem child, which it is, in Vim's tutorial.) If a single-Enter/Return ("carriage-return") is used between two paragraphs, the "carriage-return"/spacing between them will disappear when working on the second paragraph, thus bleeding both paragraphs together. This "inoremap" for "carriage-return" simply helps w/ the "fo=a" issue that bleeds paragraphs together while still allowing a more natural Enter/Return within ":WE".
