;;; config.el --- Emacs wds Layer config File
;;dotspacemacs-configuration-layers

;Config c-mode hook
(add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode))
(add-hook 'c-mode-hook (lambda () helm-gtags-mode))
(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))
(add-hook 'c-mode-hook
          (lambda ()
                (setq indent-tabs-mode t)
		(setq default-tab-width 8)
		(setq tab-width 8)
		(setq c-hungry-delete-key t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))

;;;Config c++-mode
;(add-hook 'c++-mode-hook 'helm-gtags-mode)

;;;Config ASM-mode
(add-hook 'asm-mode-hook (lambda () helm-gtags-mode))

;(diff-hl-flydiff-mode '(:global t))

;(require 'diff-hl)
;(global-diff-hl-mode t)
;(diff-hl-margin-mode t)
;(diff-hl-flydiff-mode t)
;(diff-hl-margin-mode t)
;;;Git gutter
;;(require 'git-gutter)
;; If you enable global minor mode
;(global-git-gutter-mode t)
;(global-git-gutter+-mode t)
;; If you would like to use git-gutter.el and linum-mode
;(git-gutter:linum-setup)
