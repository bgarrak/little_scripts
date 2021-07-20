;A short AutoHotKey script to paste the current date in a hyphenated format with year as 'yy'

;Esc::ExitApp  ; Exit script with Escape key
;^!p::Pause    ; Pause script with Ctrl+Alt+P
;^!s::Suspend  ; Suspend script with Ctrl+Alt+S
;^!r::Reload   ; Reload script with Ctrl+Alt+R

; Press control + d to print the current date
^d::

; For forward slash formatting - uncomment this line
;FormatTime, date,, MM/dd/yy

; For hyphen formatting with short year format - uncomment this line
FormatTime, date,, MM-dd-yy

; Comment the following line if switching to the "SendInput" styling
send, %date%

; For long year hyphen formatting - uncomment this line. 
;SendInput %A_MM%-%A_DD%-%A_YYYY%
Return
