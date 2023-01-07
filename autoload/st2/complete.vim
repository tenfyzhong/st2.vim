function! s:short_flags()
  return sort(['-d', '-i', '-r', '-s'])
endfunction

function! s:long_flags()
  return sort(['--dst', '--input', '--root', '--src', '--rc', '--wc'])
endfunction

function! s:flags()
  let short = <SID>short_flags()
  let long = <SID>long_flags()
  return short + long
endfunction

function! s:src()
  return sort(['json', 'proto', 'thrift', 'go', 'csv'])
endfunction

function! s:dst()
  return sort(['go', 'proto', 'thrift'])
endfunction

function! s:file(cur)
  return getcompletion(a:cur, 'file')
endfunction

function! s:get_last_flag(A, L)
  if a:A == ''
    let items = split(a:L, ' ')
  else
    let items = split(a:L, ' ')[0:-2]
  endif
  let items = reverse(items)
  for v in items
    if v != ''
      return v
    endif
  endfor
  return ''
endfunction

function! st2#complete#complete(A, L, P)
  let completed = <SID>flags()
  if a:A =~ '^--'
    let completed = <SID>long_flags()
  elseif a:A =~ '^-'
    let completed = <SID>flags()
  else
    let last = <sid>get_last_flag(a:A, a:L)
    if last == 'St2'
      let completed = <SID>flags()
    elseif last == '--src' || last == '-s'
      let completed = <SID>src()
    elseif last == '--dst' || last == '-d'
      let completed = <SID>dst()
    elseif last == '--input' || last == '-i'
      let completed = <SID>file(a:A)
    elseif last == '--root' || last == '-r'
      let completed = []
    endif
  endif
  return join(completed, "\n")
endfunction
