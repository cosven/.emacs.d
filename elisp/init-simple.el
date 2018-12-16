
;;; Code:

(defun mcenter-current-frame ()
  "Frame 屏幕居中."
  (interactive)
  (let* ((workarea (frame-monitor-workarea (selected-frame)))
         (min-x (pop workarea))
         (min-y (pop workarea))
         (max-x (pop workarea))
         (max-y (pop workarea))
         (pos-x (/ (- max-x min-x (frame-outer-width)) 2))
         (pos-y (/ (- max-y min-y (frame-outer-height)) 2)))
    (message "%d %d" pos-x pos-y)
    (set-frame-position (selected-frame) pos-x pos-y)
    ))


(provide 'init-simple)

;;; init-simple.el ends here
