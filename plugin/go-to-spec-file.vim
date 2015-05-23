" Go to rspec file
" Last Change: 2015 May 22
" Maintainer: Szymon Kieloch <skieloch@gmail.com>
" License: This file is placed in the public domain.
"
" Features:
" * Open rspec test file for currently opened file
"
" Changelist:
"
" * 2015 May 22
"   Open rspec test file for currently opened file

function! GetTestFilePath()
" ruby << EOF
"   current_buffer = VIM::Buffer.current
"   current_buffer.name.gsub(/^\w+/, 'spec').gsub(/\.rb$/, '_spec.rb')
" EOF
echo a
endfunction

function! GoToTestFile()
  echo GetTestFilePath()
endfunction

