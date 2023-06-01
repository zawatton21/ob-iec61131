;;; ob-iec61131.el --- org-babel functions for VBA (Visual Basic for Applications) evaluation

;; Copyright (C) 2023 Takahiro FUJISAWA

;; Author: Takahiro FUJISAWA
;; Keywords: literate programming, reproducible research, typescript
;; Homepage: https://github.com/zawatton21/ob-vba
;; Version: 0.1
;; Package-Requires: ((emacs "24") (org "8.0"))

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; Exec Structured Text (IEC61131-3) in org-babel code blocks.

;;; Code:
(require 'ob)
(require 'iec61131-mode)

;; optionally define a file extension for this language
(add-to-list 'org-babel-tangle-lang-exts '("iec61131" . "st"))

(add-to-list 'org-src-lang-modes '("structured-text" . iec61131))

(defun org-babel-execute:iec61131 (body params)
  "Execute a block of iec61131 code with org-babel."
  (let ((result
         (with-temp-buffer
           (insert body)
           ;; here you'll need to call whatever iec61131 interpreter you're using
           ;; This example assumes there's a "iec61131" interpreter in the path
           (call-process-region (point-min) (point-max) "iec61131" t t nil)
           ))
        (result-type (cdr (assoc :result-type params))))
    (org-babel-result-cond result-type result "")))

(provide 'ob-iec61131)

;;; ob-iec61131.el ends here
