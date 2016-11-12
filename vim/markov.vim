python3 << EOF
import ctypes, vim

markov = ctypes.cdll.LoadLibrary("/usr/local/lib/libmarkov.so")
markov.initialize_chain(b"/usr/local/share/markov-chain")

def insert():
    out = ctypes.create_string_buffer(128)
    ln = vim.current.line.encode()
    s = markov.nextWord(out, 128, ctypes.create_string_buffer(ln), len(ln))
    vim.current.line += out.value.decode()
    return s

def substitute():
    words = vim.current.line.rstrip().split(" ")
    vim.current.line = " ".join(words[:-1]) + " "
    if insert() == 0:
        vim.current.line += words[-1]

EOF

inoremap  <Esc>:python3 substitute()<CR>$a
inoremap ` <Esc>:python3 insert()<CR>$a
inoremap  `