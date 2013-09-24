;; Keymaps
(let ((nmap (ViMap normalMap))
      (imap (ViMap insertMap))
      (vmap (ViMap visualMap)))

; Redo
(nmap setKey:"U" toAction:"vim_redo:")
; Delete surrounding single quotes
(nmap map:"ds'" to:"F'xf'x")
; Delete surrounding double quotes
(nmap map:"ds\"" to:"F\"xf\"x")
; Delete surrounding parens
(nmap map:"ds(" to:"di(p<left><left>xx")
; Delete surrounding square brackets
(nmap map:"ds[" to:"di[p<left><left>xx")
; Delete surrounding curly brackets
(nmap map:"ds{" to:"di{p<left><left>xx")
; Insert newline above current line
(imap map:"<shift-cmd-cr>" to:"<esc>O")
; Surround selection with single quotes
(vmap map:"S'" to:"c''<esc><bs>p")
; Surround selection with double quotes
(vmap map:"S\"" to:"c\"\"<esc><bs>p")
; Surround selection with parens
(vmap map:"S(" to:"c()<esc><bs>p")
; Surround selection with square brackets
(vmap map:"S[" to:"c[]<esc><bs>p")
; Surround selection with curly brackets
(vmap map:"S{" to:"c{}<esc><bs>p"))


;; Event actions
; Strip trailing white space on save from certain filetypes
(eventManager on:"willSaveDocument" do: (do (doc)
    (let (scope (((current-document) language) name))
        (if (/nu|html|css|stylus|js$/ findInString:scope)
            ((doc text) input:-":%s/[^\\S\\n]+$//<cr>")))))
