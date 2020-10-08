" Vim syntax file
" Language: Zig
" Maintainer: Andrew Kelley
" Latest Revision: 03 August 2016

if exists("b:current_syntax")
  finish
endif
let b:current_syntax = "ez"

syn keyword ezStorage set Set change Change Function function
syn keyword ezStatement break return
syn keyword ezConditional if and or
syn keyword ezRepeat loop

syn match zigType "\v<[iu][1-9]\d*>"

syn match  ezOperator display "\V\[-+/*=^&?|!><%~]"
" syn match  ezArrowCharacter display "\V->"
"          ez                         12_34  (. but not ..)? (12_34)?     (exponent  12_34)?
syn match  ezDecNumber display   "\v<\d%(_?\d)*%(\.\.@!)?%(\d%(_?\d)*)?%([eE][+-]?\d%(_?\d)*)?"

syn match  ezCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match  ezCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match  ezCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=zigEscape,zigEscapeError,zigCharacterInvalid,zigCharacterInvalidUnicode
syn match  ezCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u\x\{4}\|U\x\{6}\)\)'/ contains=zigEscape,zigEscapeUnicode,zigEscapeError,zigCharacterInvalid

syn region ezBlock start="," end="!" transparent fold

syn region ezCommentLine start="[" end="]"

hi def link zigDecNumber zigNumber

" hi def link ezKeyword Keyword
" hi def link ezType Type
hi def link ezCommentLine Comment
hi def link ezCharacterInvalid Error
hi def link ezCharacterInvalidUnicode zigCharacterInvalid
hi def link ezCharacter Character
hi def link ezEscapeError Error
hi def link ezOperator Operator
hi def link ezStorage StorageClass
hi def link ezStructure Structure
hi def link ezStatement Statement
hi def link ezConditional Conditional
hi def link ezRepeat Repeat
