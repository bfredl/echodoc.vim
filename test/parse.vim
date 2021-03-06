" set verbose=1
scriptencoding utf8

let s:assert = themis#helper('assert')
let s:suite = themis#suite('parse')

function! s:suite.parse_funcs() abort
  let args = echodoc#util#parse_funcs(
        \ 'void main(int argc)', '')[0]['args']
  call s:assert.equals(args, ['int argc'])
  let args = echodoc#util#parse_funcs(
        \ 'int32_t get (*)(void *const, const size_t)', '')[0]['args']
  call s:assert.equals(args, ['void *const', ' const size_t'])
  let args = echodoc#util#parse_funcs(
        \ 'void process(std::array<T,size> array){...}', '')[0]['args']
  call s:assert.equals(args, ['std::array<...> array'])
endfunction
