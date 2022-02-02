
(define (string-last str)
  (string-ref str (- (string-length str) 1)))

(define-record-type <parser-state>
  (make-parser-state name doc lvl beg end m t)
  parser-state?
  ())

(define (make-empty-parser-state)
  (make-parser-state '()
                     #f
                     0
                     0
                     0
                     '()
                     '()))

(define (make-parser reciever)
  (let ((pos 0)
        (end 0)
        (input "")
        (state '())
        (trace-num 0)
        (trace-line 0)
        (trace-on #t)
        (trace-off 0)
        (trace-info (vector "" "" "")))

    (define (parse input)
      (unless (or (= 0 (string-length input))
                  (char=? #\newline (string-last input)))
        (string-append input "\n"))
      (set! end (string-length input))
      (set! trace-on (if +trace+ (not (trace-start)) trace-on))
      #t)
    
    (define (state-curr)
      (if (null? state)
        (make-parser-state)
        (car state)))
    
    (define (state-prev)
      (cadr state))
    
    (define (state-push name)
      (let ((curr (state-curr)))
        (set! state
              (cons (make-parser-state name 
                                       (parser-state-doc curr))
                    state))))

    (define (dispatch method)
      (case method
        ((parse) parse)))

    ((reciever 'set-parser) parser)

    dispatch))

(define (parser-parse! p input)
  ((p 'parse) input))


