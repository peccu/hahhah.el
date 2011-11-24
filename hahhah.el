;;; hahhah.el --- hahhah  ﾊｧﾊｧ...

;; Copyright (C) 2011 Kentarou Shimatani

;; Author: Kentaro Shimatani <kentarou.shimatani@gmail.com>
;; Created: 24 Nov 2011
;; Keywords: function

;;; Commentary:
;; this is a redistribution of mattn's hahhah-vim (https://github.com/mattn/hahhah-vim)

;;; Installation:
;; Put the hahhah.el to your load-path.
;; Add to your ~/.emacs.d/init.d or ~/.emacs:
;;  (require 'hahhah)
;;  (hahhah-mode t)

;; It will display ﾊｧﾊｧ... on mode-line

;;; documents from
;; https://github.com/mattn/hahhah-vim/blob/master/doc/hahhah.jax

;; hahhah  ﾊｧﾊｧ...
;;                                                                         *hahhah*

;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... 　　　　　　　　　　　　　　　　　　　　　　　　ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... 　　　　　　　##　　　　　　　　　　　　　　##　　　　　　　　　ﾊｧﾊｧ...
;; 　　　　　　　　　　##　　　　　　　　　　　　　　　　##　　　　　　　　　　　 
;; 　　　　　##　　　##　　　　　　　　　　　　　　　　　　##　　　　　##　　　　 
;; 　　　　##　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　##　　　 
;; 　　　　##　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　##　　　 
;; 　　　##　　　　　　　　　　　　　　########　　　　　　　　####　　　　##　　 
;; 　　　##　　　　　　　　　　　　　　##　　##　　　　　　　　####　　　　##　　 
;; 　　　##　　　　　　　　　　　　　##　　　##　　　　　　　　　　　　　　##　　 
;; 　　　##　　　　　　　　　　　　　##　　　##　　　　　　　　　　　　　　##　　 
;; 　　　##　　　　　　　　　　　　##　　　　##　　　　　　　　　　　　　　##　　 
;; 　　　##　　　　　　　　　　　　##　　　　##　　　　　　　　####　　　　##　　 
;; 　　　　##　　　　　　　　　　　##　　　　##　　　　　　　　　##　　　##　　　 
;; 　　　　##　　　　　　　　　　　##############　　　　　　　　##　　　##　　　 
;; ﾊｧﾊｧ... 　##　　　　　　　　　　##　　　　　##　　　　　　　##　　　##　ﾊｧﾊｧ...
;; ﾊｧﾊｧ... 　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　　ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...
;; ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ... ﾊｧﾊｧ...

;; ==============================================================================
;; CONFIG                                                     *hahhah-introduction*

;; This plugin provide function |HahHah| in global scope. So you can contain the
;; function into your 'statusilne' option like following.
;; >
;;   set statusline=%=%{g:HahHah()}
;; <

;; vim:tw=78:ts=8:ft=help:norl:noet:fen:fdl=0:

;;; Code:

(defgroup hahhah nil
  "Showing hahhah on mode-line."
  :prefix "hahhah-"
  :group 'paren-matching)

(defcustom hahhaherrp nil
  "*If you want to show hahhaherr, turn this t."
  :type 'boolean
  :group 'hahhah)

(defcustom hahhah-interval
  (if (featurep 'lisp-float-type) (/ (float 1) (float 8)) 1)
  "*Time in seconds to delay before showing a hahhah."
  :type '(number :tag "seconds")
  :group 'hahhah)

(defvar hahhah-timer nil)

(defvar hahhahstr
  '("(´д｀;)"
    "( ´д`;)"
    "(  ´д`)"
    "(　 ´д)"
    "(　　 ´)"
    "( 　　  )"
    "(　　　 )"
    "(; 　　 )"
    "( ;　　 )"
    "(` ;　　)"
    "(д` ;　)"))
(defvar hahhahstr-size (length hahhahstr))

(defvar hahhaherr
  '("　　　ｪ(´д｀)ｪ　　　"
    "　　ェｪ(´д｀)ｪェ　　"
    "　エェｪ(´д｀)ｪェエ　"
    "工エェｪ(´д｀)ｪェエ工"))
(defvar hahhaherr-size (length hahhaherr))

(defvar hahhah-string nil)
(defun hahhah-function ()
  "Display the hahhah."
  (if hahhah-mode
      (if hahhaherrp
          (nth (% num-input-keys hahhaherr-size) hahhaherr)
        (nth (% num-input-keys hahhahstr-size) hahhahstr))
    ""))
;; (hahhah-function)

(defun hahhah-update ()
  (setq hahhah-string
        (hahhah-function))
  (force-mode-line-update))
;; (hahhah-update)

;;;###autoload
(define-minor-mode hahhah-mode
  "Toggle display of hahhah.
With a numeric arg, enable this display if arg is positive.

When this display is enabled, it updates automatically every input.
If `hahhaherrp' is non-nil, hahhaherr is displayed as well."
  :global t :group 'hahhah
  (and hahhah-timer (cancel-timer hahhah-timer))
  (setq hahhah-timer nil)
  (setq hahhah-string "")
  (or global-mode-string (setq global-mode-string '("")))
  (when hahhah-mode
    (progn
      (or (memq 'hahhah-string global-mode-string)
          (setq global-mode-string
                (append global-mode-string '(hahhah-string))))
      ;; Set up the time timer.
      (setq hahhah-timer
            (run-with-idle-timer hahhah-interval t
                                 'hahhah-update))
      ;; Make the time appear right away.
      (hahhah-update))))
;; (hahhah-mode t)

(provide 'hahhah)
;;; hahhah.el ends here
