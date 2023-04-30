(server-start)
(global-set-key [remap list-buffers] 'ibuffer)
(fido-mode)
(electric-pair-mode)
(global-company-mode)
(winner-mode)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-M-g") 'delete-active-region)
(windmove-default-keybindings)
(visual-line-mode)
(column-number-mode)
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-hl-line-mode 1)
;; (ido-mode 1)
;; (setq ido-everywhere 1)
;; (setq ido-enable-flex-matching 1)
;; (kill-whole-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "f681100b27d783fefc3b62f44f84eb7fa0ce73ec183ebea5903df506eb314077" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "fa49766f2acb82e0097e7512ae4a1d6f4af4d6f4655a48170d0a00bcb7183970" "3e374bb5eb46eb59dbd92578cae54b16de138bc2e8a31a2451bf6fdb0f3fd81b" "19a2c0b92a6aa1580f1be2deb7b8a8e3a4857b6c6ccf522d00547878837267e7" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" default))
 '(display-line-numbers t)
 '(isearch-allow-motion t)
 '(isearch-allow-scroll t)
 '(package-selected-packages
   '(helm smartparens company tree-sitter-langs tree-sitter eglot magit dracula-theme material-theme spacemacs-theme monokai-theme gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(require 'use-package)

;; ========== TREE-SITTER ==========
(require 'tree-sitter)
(require 'tree-sitter-langs)
(tree-sitter-require 'python)

(global-tree-sitter-mode)

(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)



;; ========== TREE-SITTER ==========




;; ========== PYTHON SETUP ==========
;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; Make eglot start automatically
(use-package eglot
  :ensure t
  :defer t
  :hook (python-mode . eglot-ensure))

(use-package eglot
  :ensure t
  :defer t
  :bind (:map eglot-mode-map
              ("C-c C-d" . eldoc)
              ("C-c C-e" . eglot-rename)
              ("C-c C-o" . python-sort-imports)
              ("C-c C-f" . eglot-format-buffer))
  :hook ((python-ts-mode . eglot-ensure)
         (python-ts-mode . flyspell-prog-mode)
         (python-ts-mode . superword-mode)
         (python-ts-mode . hs-minor-mode)
         (python-ts-mode . (lambda () (set-fill-column 88))))
  :config
  (setq-default eglot-workspace-configuration
                '((:pylsp . (:configurationSources ["flake8"]
                             :plugins (
;;                                       :pycodestyle (:enabled :json-false)
                                       :mccabe (:enabled :json-false)
                                       :pyflakes (:enabled :json-false)
                                       :flake8 (:enabled :json-false
                                                :maxLineLength 88)
                                       :ruff (:enabled t
                                              :lineLength 88)
                                       :pydocstyle (:enabled t
                                                    :convention "numpy")
                                       :yapf (:enabled :json-false)
                                       :autopep8 (:enabled :json-false)
                                       :black (:enabled t
                                               :line_length 88
                                               :cache_config t)))))))
;; ========== PYTHON SETUP ==========
