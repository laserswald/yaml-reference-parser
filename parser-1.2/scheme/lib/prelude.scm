
(include "yasos.scm")

(define (string-last str)
  (string-ref str (- (string-length str) 1)))

(define-record-type <parser-state>
  (make-parser-state name documentation level beginning end marks t)
  parser-state?
  (name parser-state-name)
  (documentation parser-state-documentation)
  (level parser-state-level)
  (beginning parser-state-beginning)
  (end parser-state-end)
  (marks parser-state-marks)
  (t parser-state-t))

(define (make-empty-parser-state)
  (make-parser-state '() #f 0 0 0 '() '()))

(define (make-parser-state-child name parent)
  ())

(define-record-type <parser-trace>
  (make-parser-trace)
  parser-trace?
  (num  trace-num set-trace-num!)
  (line trace-line set-trace-line!)
  (enabled trace-enabled? set-trace-enabled!)
  (off trace-off set-trace-off!)
  (info trace-info set-trace-info!))

(define-record-type <yaml-parser>
  (%make-yaml-parser reciever position end input state)
  yaml-parser?
  (reciever yaml-parser-reciever)
  (position yaml-parser-position set-yaml-parser-position!)
  (end yaml-parser-end set-yaml-parser-end!)
  (input yaml-parser-input set-yaml-parser-input!)
  (state yaml-parser-state set-yaml-parser-state!)
  (trace yaml-parser-trace set-yaml-parser-trace!))

(define (make-parser reciever)
  (%make-yaml-parser reciever 0 0 "" '() (make-parser-trace)))

(define (yaml-parse! parser input)
  (unless (or (= 0 (string-length input))
              (char=? #\newline (string-last input)))
    (string-append input "\n"))
  (set-yaml-parser-end! parser (string-length input))
  (set-trace-enabled! (yaml-parser-trace parser)
                      (if +trace+ (not (trace-start self)) trace-on))
  (dynamic-wind 
   values
   (lambda ()
     (yaml-parser-TOP! parser))
   (lambda ()
     (parser-trace-flush! (yaml-parser-trace parser))))
  #t)

(define (yaml-parser-current-state parser)
  (if (null? (yaml-parser-state parser))
    (make-empty-parser-state)
    (car (yaml-parser-state parser))))

(define (yaml-parser-previous-state parser)
  (cadr state))

(define (yaml-parser-push-state! parser)
  (let ((curr (state-curr)))
    (set! state
          (cons (make-parser-state-child name)
                state))))
