let s:isDirectoryToggled = 0
autocmd BufCreate * let s:isDirectoryToggled = 0
command! ToggleProjectTree :call ToggleProjectTree()
function! ToggleProjectTree()
    if s:isDirectoryToggled
        let bnr = len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) 
        let s:isDirectoryToggled = 0
        if bnr > 0
            :b
        else
            :new
            :winc j
            :q
        endif
    else
        :e . 
        let s:isDirectoryToggled = 1
    endif
endfunction
