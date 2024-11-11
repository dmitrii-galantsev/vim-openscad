#!/usr/bin/env fish

if ! test -e 'constants.scad'
    set_color --bold red; echo "Cannot find constants.scad!"; set_color normal
    exit 1
end

rm -f openscad_syn.vim
rm -f openscad_hi.vim
rm -f openscad.vim

set HEADER '" Vim syntax file
" Language:     OpenSCAD
" Maintainer:   Sirtaj Singh Kang <sirtaj-vim@sirtaj.net>
" Last Changed: 2013 March 05

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


"syn keyword openscadFunctionDef function
syn keyword openscadFunctionDef function nextgroup=openscadFunction skipwhite skipempty
syn match openscadFunction /\<\h\w*\>/ contained display

"syn keyword openscadModuleDef module
syn keyword openscadModuleDef module nextgroup=openscadModule skipwhite skipempty
syn match openscadModule /\<\h\w*\>/ contained display

syn keyword openscadStatement echo assign let assert
syn keyword openscadConditional if else
syn keyword openscadRepeat for intersection_for
syn keyword openscadInclude include use
syn keyword openscadCsgKeyword union difference intersection render intersection_for
syn keyword openscadTransform scale rotate translate mirror multmatrix color minkowski hull projection linear_extrude rotate_extrude offset
syn keyword openscadPrimitiveSolid cube sphere cylinder polyhedron surface
syn keyword openscadPrimitive2D square circle polygon import_dxf text
syn keyword openscadPrimitiveImport import child children'

set -a HEADER "

\" BOSL2 version: $(git rev-parse HEAD)"

set SUFFIX '

syn match openscadSpecialVariable "\$[a-zA-Z0-9_]\+\>" display
syn match openscadModifier "^\s*[\*\!\#\%]" display

syn match openscadNumbers "\<\d\|\.\d" contains=openscadNumber display transparent
syn match openscadNumber "\d\+" display contained 
syn match openscadNumber "\.\d\+" display contained 

syn region openscadString start=/"/ skip=/\\\"/ end=/"/

syn keyword openscadBoolean true false

syn keyword openscadCommentTodo TODO FIXME XXX contained display
syn match openscadInlineComment ://.*$: contains=openscadCommentTodo
syn region openscadBlockComment start=:/\*: end=:\*/: fold contains=openscadCommentTodo

syn region openscadBlock start="{" end="}" transparent fold
syn region openscadVector start="\[" end="\]" transparent fold

syn keyword openscadBuiltin abs acos asin atan atan2 ceil cos exp floor ln log
syn keyword openscadBuiltin lookup max min pow rands round sign sin sqrt tan
syn keyword openscadBuiltin str len search version version_num concat chr
syn keyword openscadBuiltin dxf_cross dxf_dim

hi def link openscadFunctionDef			Structure
hi def link openscadFunction			Function
hi def link openscadModuleDef			Structure
hi def link openscadModule			    Function
hi def link openscadBlockComment		Comment
hi def link openscadBoolean			    Boolean
hi def link openscadBuiltin			    Function
hi def link openscadConditional			Conditional
hi def link openscadCsgKeyword			Structure
hi def link openscadInclude			    Include
hi def link openscadInlineComment	    Comment
hi def link openscadModifier			Special
hi def link openscadStatement			Statement
hi def link openscadNumbers			    Number
hi def link openscadNumber			    Number
hi def link openscadPrimitiveSolid		Keyword
hi def link openscadPrimitive2D 		Keyword
hi def link openscadPrimitiveImport 	Keyword
hi def link openscadRepeat			    Repeat
hi def link openscadSpecialVariable		Special
hi def link openscadString			    String
hi def link openscadTransform			Statement
hi def link openscadCommentTodo			Todo
'

set FOOTER '
" Blatantly stolen from vim74\syntax\c.vim
"when wanted, highlight trailing white space
if exists("openscad_space_errors")
  if !exists("openscad_no_trail_space_error")
    syn match	openscadSpaceError	display excludenl "\s\+$"
  endif
  if !exists("openscad_no_tab_space_error")
    syn match	openscadSpaceError	display " \+\t"me=e-1
  endif
endif

let b:current_syntax = "openscad"

" vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4 nowrap
'

set_color cyan --bold; echo "Generating txt files..."; set_color normal
for k in *.scad
    if test "$k" = "constants.scad" || test "$k" = "builtins.scad" || test "$k" = "std.scad"
        echo "skipping $k"
        continue
    end
    set_color grey; echo $k; set_color normal
    set name $(basename $k .scad)
    grep -iEo '^(module|function) ([^_][^\(]*)' $k | grep -iEo '\S+$' | sort | uniq > $name.txt
end

set_color cyan --bold; echo "Generating syntax files..."; set_color normal
for k in *.txt
    set name $(basename $k .txt)
    set_color grey; echo $k; set_color normal
    echo "syn keyword openscadBosl2$name $(cat $k | xargs)" >> openscad_syn.vim
    echo "hi def link openscadBosl2$name        Keyword" >> openscad_hi.vim
end


set constants $(cat constants.scad | grep -E '^\S+\s=' | grep -Eo '^\S+' | xargs)
echo "syn keyword openscadBosl2constants $constants" >> openscad_syn.vim
echo "" >> openscad_syn.vim
echo "hi def link openscadBosl2constants        Special" >> openscad_hi.vim

cat $(echo $HEADER | psub) openscad_syn.vim $(echo $SUFFIX | psub) openscad_hi.vim $(echo $FOOTER | psub) > openscad.vim
rm openscad_syn.vim
rm openscad_hi.vim
