function! st2#on_stdout(chanid, data, name)
endfunction

function! st2#on_stderr(chanid, data, name)
endfunction

function! st2#gen(args)
  if !executable('st2')
    echom 'Please install `st2` first: go install github.com/tenfyzhong/st2/cmd/st2@latest'
    return
  endif

  let has_dst = match(a:args, ' -d\|--dst ')
  if has_dst != -1
    let cmd = printf('st2 %s', a:args)
  else
    let ft=&ft
    let cmd = printf('st2 %s -d %s', a:args, ft)
  endif

  let str = system(cmd)
  if v:shell_error != 0 
    echohl ErrorMsg | echom 'St2 error: ' . str | echohl None
    return
  endif
  let lines = split(str, "\n")
  call append(line('.'), lines)
endfunction
