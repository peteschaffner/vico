;; Keymaps
(let ((nmap (ViMap normalMap))
      (imap (ViMap insertMap)))

; Redo
(nmap setKey:"U" toAction:"vim_redo:");
; Insert newline above current line
(imap map:"<shift-cmd-cr>" to:"<esc>O"))


;; Event actions
; Strip trailing white space on save from certain filetypes
(eventManager on:"willSaveDocument" do: (do (doc)
    (let (scope (((current-document) language) name))
        (if (/nu|html|css|stylus|js$/ findInString:scope)
            ((doc text) input:-":%s/[^\\S\\n]+$//<cr>")))))
