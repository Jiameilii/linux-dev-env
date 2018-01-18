;;; keybindings.el --- Emacs wds Layer key bindings File

(global-set-key (kbd "C-s") 'spacemacs/helm-swoop-region-or-symbol)

;;helm gtags keybind
;; (global-set-key (kbd "M-g") 'helm-gtags-dwim)
;; (global-set-key (kbd "M-]") 'helm-gtags-find-tag)
;; (global-set-key (kbd "M-r") 'helm-gtags-find-rtag)
;; (global-set-key (kbd "M-s") 'helm-gtags-find-symbol)
;; (global-set-key (kbd "C-t") 'helm-gtags-pop-stack)

;;Buffer
;;Switch buffer
(global-set-key (kbd "M-s M-s") 'mode-line-other-buffer)
(global-set-key (kbd "<M-left>") 'previous-buffer)
(global-set-key (kbd "<M-right>") 'next-buffer)

;;project git search
(global-set-key (kbd "C-c e") 'helm-fasd)
(global-set-key (kbd "C-<f12>") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)

;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-g") 'helm-gtags-dwim)
             (local-set-key (kbd "M-S") 'helm-gtags-show-stack)
             (local-set-key (kbd "M-p") 'helm-gtags-previous-history)
             (local-set-key (kbd "M-n") 'helm-gtags-next-history)
             (local-set-key (kbd "M-]") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
             ))
