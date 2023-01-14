function! st2#gen(args)
  if !executable('st2')
    echom 'Please install `st2` first: go install github.com/tenfyzhong/st2/cmd/st2@latest'
    return
  endif

  let has_dst = match(a:args, ' -d\|--dst ')
  if has_dst != -1
    let cmd = printf('st2 %s 2>/dev/null', a:args)
  else
    let ft=&ft
    let cmd = printf('st2 %s -d %s 2>/dev/null', a:args, ft)
  endif

  let str = system(cmd)
  let lines = split(str, "\n")
  call append(line('.'), lines)
endfunction
