if exists('g:st2_loaded')
  finish
endif
let g:st2_loaded = 1

command! -nargs=+ -complete=custom,st2#complete#complete St2 call st2#gen(<q-args>)
