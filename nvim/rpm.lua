-- Abbrevations for rpm
vim.cmd [[
" function! GetSpecInfo()
"     " Get the current buffer number
"     let l:bufnr = bufnr('%')
"
"     " Initialize version and release variables
"     let l:version = ''
"     let l:release = ''
"
"     " Iterate over the lines in the buffer
"     for l:num in range(1, line('$'))
"         let l:line = getline(l:num)
"
"         " Check if the line contains the version
"         if l:line =~ '^Version:'
"             let l:version = substitute(l:line, '^Version:\s*', '', '')
"         " Check if the line contains the release
"         elseif l:line =~ '^Release:'
"             let l:release = substitute(l:line, '^Release:\s*', '', '')
"             " Remove %{?dist} from the release string
"             let l:release = substitute(l:release, '%{?dist}', '', '')
"         endif
"     endfor
"
"     " Return the version and release
"     return l:version . '-' . l:release
" endfunction

function! GetSpecInfo(filepath='')
    " Initialize version and release variables
    let l:version = ''
    let l:release = ''
    let l:lines = []

    " Read lines from the specified file or the current buffer
    if a:filepath != ''
        if filereadable(a:filepath)
            let l:lines = readfile(a:filepath)
        else
            echo "File not readable: " . a:filepath
            return ''
        endif
    else
        let l:lines = getline(1, '$')
    endif

    " Iterate over the lines
    for l:line in l:lines
        " Check if the line contains the version
        if l:line =~ '^Version:'
            let l:version = substitute(l:line, '^Version:\s*', '', '')
        " Check if the line contains the release
        elseif l:line =~ '^Release:'
            let l:release = substitute(l:line, '^Release:\s*', '', '')
            " Remove %{?dist} from the release string
            let l:release = substitute(l:release, '%{?dist}', '', '')
        endif
    endfor

    " Return the version and release
    return l:version . '-' . l:release
endfunction

function! UpstreamSpecPath()
    " Get the current working directory
    let l:pwd = getcwd()
    " Get the base name of the current working directory
    let l:basename = fnamemodify(l:pwd, ':t')
    " Construct the file path
    let l:filepath = l:pwd . '/upstream/' . l:basename . '.spec'

    return l:filepath
endfunction

" language time en_US.UTF8
iab <expr> dst strftime("%a %b %d %Y") . " Wang Tiaoke <wangtiaoke@cqsoftware.com.cn> - " . GetSpecInfo()
iab <expr> vst GetSpecInfo(UpstreamSpecPath())
]]
