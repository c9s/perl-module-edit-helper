
fun! s:ModuleEdit(module,act)
  let path = system('perl -e "print join(qq{,},@INC)"')
  let paths = split(path,",")
  let modulefile = substitute(a:module,'::','/','g') . ".pm"
  for path in paths 
    let modulepath = path . '/' . modulefile
    if filereadable(modulepath)
      exec a:act . ' ' . modulepath
      return
    endif
  endfor
  echo "Module File not found."
endf

" cal s:ModuleEdit("Foo::Bar",'tabe')

com! -narg=1 ModuleTabEdit    :cal s:ModuleEdit(<q-args>, 'tabe' )
com! -narg=1 ModuleSplitEdit  :cal s:ModuleEdit(<q-args>, 'split')
com! -narg=1 ModuleVSplitEdit :cal s:ModuleEdit(<q-args> , 'vsplit')

cabbr ME ModuleTabEdit
cabbr MTE ModuleTabEdit
cabbr MSE ModuleSplitEdit
cabbr MVSE ModuleVSplitEdit

