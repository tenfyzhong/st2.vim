# 0. Introduction                                  *st2-introduction*
vim plugin for https://github.com/tenfyzhong/st2

# 1. Install                                       *st2-install*
a. Install `st2` first  
`go install github.com/tenfyzhong/st2/cmd/st2@latest`  
 
b. Install vim plugin  
Suggest use a plugin manager, such vim-plug or other.  
- [vim-plug](https://github.com/junegunn/vim-plug) >
```vim
  Plug 'tenfyzhong/st2.vim' 
```
- Manual >
```bash
  git clone https://github.com/tenfyzhong/st2.vim.git ~/.vim/bundle/st2.vim
  echo 'set rtp+=~/.vim/bundle/st2.vim' >> ~/.vimrc
  vim -c 'helptag ~/.vim/bundle/st2.vim/doc' -c qa!
```


# 2. Usage
|St2| has the same flag with shell command `st2`. 

# 3. Command
*St2* call the shell command `st2` and append the output data to the current
line.


# 4. LICENSE
MIT License  Copyright (c) 2022 tenfy
