" Author: Laszlo Dienes <laszlo22.dienes@gmail.com>
" Description: Integration of hh_client with ALE.

call ale#Set('hack_hh_client_executable', 'hh_client')
call ale#Set('hack_hh_client_options', '')

function! ale#fixers#hh_client#Fix(buffer) abort
    let l:hhconfig = ale_linters#hack#hack#GetProjectRoot(a:buffer)

    let l:executable = ale#Var(a:buffer, 'hack_hh_client_executable')
    let l:options = ale#Var(a:buffer, 'hack_hh_client_options')

    return {
    \   'command': ale#Escape(l:executable)
    \       . ' --format 0 ' . (wordcount()['chars']+1)
    \       . (empty(l:options) ? '' : ' ' . l:options)
    \       . ' --from vim-ale'
    \       . ' ' . l:hhconfig,
    \}
endfunction
