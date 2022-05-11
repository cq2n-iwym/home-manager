nnoremap <silent> <F5>       <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10>      <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11>      <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12>      <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b  <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B  <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>df <Cmd>lua require'jdtls'.test_class()<CR>
nnoremap <silent> <Leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>
