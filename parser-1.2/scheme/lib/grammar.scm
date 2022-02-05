;;;
;;; This grammar class was generated from https://yaml.org/spec/1.2/spec.html
;;;


(import (scheme base)
        (scheme read)
        (scheme write))

(include "prelude.scm")

(define +debug+ (get-environment-variable "DEBUG"))



; [001]
; c-printable ::=
;   x:9 | x:A | x:D | [x:20-x:7E]
;   | x:85 | [x:A0-x:D7FF] | [x:E000-x:FFFD]
;   | [x:10000-x:10FFFF]

(define (yaml-parser-parse!/c-printable self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-printable"))
  (any     (chr #\x09)
      (chr #\x0A)
      (chr #\x0D)
      (rng #\x20 #\x7E)
      (chr #\x85)
      (rng #\xA0 #\xD7FF)
      (rng #\xE000 #\xFFFD)
      (rng #\x010000 #\x10FFFF)))



; [002]
; nb-json ::=
;   x:9 | [x:20-x:10FFFF]

(define (yaml-parser-parse!/nb-json self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-json"))
  (any     (chr #\x09)
      (rng #\x20 #\x10FFFF)))



; [003]
; c-byte-order-mark ::=
;   x:FEFF

(define (yaml-parser-parse!/c-byte-order-mark self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-byte-order-mark"))
  (chr #\xFEFF))



; [004]
; c-sequence-entry ::=
;   '-'

(define (yaml-parser-parse!/c-sequence-entry self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-sequence-entry"))
  (chr #\-))



; [005]
; c-mapping-key ::=
;   '?'

(define (yaml-parser-parse!/c-mapping-key self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-mapping-key"))
  (chr #\?))



; [006]
; c-mapping-value ::=
;   ':'

(define (yaml-parser-parse!/c-mapping-value self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-mapping-value"))
  (chr #\:))



; [007]
; c-collect-entry ::=
;   ','

(define (yaml-parser-parse!/c-collect-entry self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-collect-entry"))
  (chr #\,))



; [008]
; c-sequence-start ::=
;   '['

(define (yaml-parser-parse!/c-sequence-start self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-sequence-start"))
  (chr #\[))



; [009]
; c-sequence-end ::=
;   ']'

(define (yaml-parser-parse!/c-sequence-end self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-sequence-end"))
  (chr #\]))



; [010]
; c-mapping-start ::=
;   '{'

(define (yaml-parser-parse!/c-mapping-start self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-mapping-start"))
  (chr #\{))



; [011]
; c-mapping-end ::=
;   '}'

(define (yaml-parser-parse!/c-mapping-end self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-mapping-end"))
  (chr #\}))



; [012]
; c-comment ::=
;   '#'

(define (yaml-parser-parse!/c-comment self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-comment"))
  (chr #\#))



; [013]
; c-anchor ::=
;   '&'

(define (yaml-parser-parse!/c-anchor self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-anchor"))
  (chr #\&))



; [014]
; c-alias ::=
;   '*'

(define (yaml-parser-parse!/c-alias self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-alias"))
  (chr #\*))



; [015]
; c-tag ::=
;   '!'

(define (yaml-parser-parse!/c-tag self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-tag"))
  (chr #\!))



; [016]
; c-literal ::=
;   '|'

(define (yaml-parser-parse!/c-literal self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-literal"))
  (chr #\|))



; [017]
; c-folded ::=
;   '>'

(define (yaml-parser-parse!/c-folded self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-folded"))
  (chr #\>))



; [018]
; c-single-quote ::=
;   '''

(define (yaml-parser-parse!/c-single-quote self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-single-quote"))
  (chr #\'))



; [019]
; c-double-quote ::=
;   '"'

(define (yaml-parser-parse!/c-double-quote self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-double-quote"))
  (chr #\"))



; [020]
; c-directive ::=
;   '%'

(define (yaml-parser-parse!/c-directive self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-directive"))
  (chr #\%))



; [021]
; c-reserved ::=
;   '@' | '`'

(define (yaml-parser-parse!/c-reserved self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-reserved"))
  (any     (chr #\@)
      (chr #\`)))



; [022]
; c-indicator ::=
;   '-' | '?' | ':' | ',' | '[' | ']' | '{' | '}'
;   | '#' | '&' | '*' | '!' | '|' | '>' | ''' | '"'
;   | '%' | '@' | '`'

(define (yaml-parser-parse!/c-indicator self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-indicator"))
  (any     (chr #\-)
      (chr #\?)
      (chr #\:)
      (chr #\,)
      (chr #\[)
      (chr #\])
      (chr #\{)
      (chr #\})
      (chr #\#)
      (chr #\&)
      (chr #\*)
      (chr #\!)
      (chr #\|)
      (chr #\>)
      (chr #\')
      (chr #\")
      (chr #\%)
      (chr #\@)
      (chr #\`)))



; [023]
; c-flow-indicator ::=
;   ',' | '[' | ']' | '{' | '}'

(define (yaml-parser-parse!/c-flow-indicator self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-flow-indicator"))
  (any     (chr #\,)
      (chr #\[)
      (chr #\])
      (chr #\{)
      (chr #\})))



; [024]
; b-line-feed ::=
;   x:A

(define (yaml-parser-parse!/b-line-feed self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-line-feed"))
  (chr #\x0A))



; [025]
; b-carriage-return ::=
;   x:D

(define (yaml-parser-parse!/b-carriage-return self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-carriage-return"))
  (chr #\x0D))



; [026]
; b-char ::=
;   b-line-feed | b-carriage-return

(define (yaml-parser-parse!/b-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-char"))
  (any     yaml-parser-parse!/b-line-feed
      yaml-parser-parse!/b-carriage-return))



; [027]
; nb-char ::=
;   c-printable - b-char - c-byte-order-mark

(define (yaml-parser-parse!/nb-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-char"))
  (but     yaml-parser-parse!/c-printable
      yaml-parser-parse!/b-char
      yaml-parser-parse!/c-byte-order-mark))



; [028]
; b-break ::=
;   ( b-carriage-return b-line-feed )
;   | b-carriage-return
;   | b-line-feed

(define (yaml-parser-parse!/b-break self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-break"))
  (any     (all     yaml-parser-parse!/b-carriage-return
          yaml-parser-parse!/b-line-feed)
      yaml-parser-parse!/b-carriage-return
      yaml-parser-parse!/b-line-feed))



; [029]
; b-as-line-feed ::=
;   b-break

(define (yaml-parser-parse!/b-as-line-feed self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-as-line-feed"))
  yaml-parser-parse!/b-break)



; [030]
; b-non-content ::=
;   b-break

(define (yaml-parser-parse!/b-non-content self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-non-content"))
  yaml-parser-parse!/b-break)



; [031]
; s-space ::=
;   x:20

(define (yaml-parser-parse!/s-space self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-space"))
  (chr #\x20))



; [032]
; s-tab ::=
;   x:9

(define (yaml-parser-parse!/s-tab self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-tab"))
  (chr #\x09))



; [033]
; s-white ::=
;   s-space | s-tab

(define (yaml-parser-parse!/s-white self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-white"))
  (any     yaml-parser-parse!/s-space
      yaml-parser-parse!/s-tab))



; [034]
; ns-char ::=
;   nb-char - s-white

(define (yaml-parser-parse!/ns-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-char"))
  (but     yaml-parser-parse!/nb-char
      yaml-parser-parse!/s-white))



; [035]
; ns-dec-digit ::=
;   [x:30-x:39]

(define (yaml-parser-parse!/ns-dec-digit self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-dec-digit"))
  (rng #\x30 #\x39))



; [036]
; ns-hex-digit ::=
;   ns-dec-digit
;   | [x:41-x:46] | [x:61-x:66]

(define (yaml-parser-parse!/ns-hex-digit self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-hex-digit"))
  (any     yaml-parser-parse!/ns-dec-digit
      (rng #\x41 #\x46)
      (rng #\x61 #\x66)))



; [037]
; ns-ascii-letter ::=
;   [x:41-x:5A] | [x:61-x:7A]

(define (yaml-parser-parse!/ns-ascii-letter self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-ascii-letter"))
  (any     (rng #\x41 #\x5A)
      (rng #\x61 #\x7A)))



; [038]
; ns-word-char ::=
;   ns-dec-digit | ns-ascii-letter | '-'

(define (yaml-parser-parse!/ns-word-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-word-char"))
  (any     yaml-parser-parse!/ns-dec-digit
      yaml-parser-parse!/ns-ascii-letter
      (chr #\-)))



; [039]
; ns-uri-char ::=
;   '%' ns-hex-digit ns-hex-digit | ns-word-char | '#'
;   | ';' | '/' | '?' | ':' | '@' | '&' | '=' | '+' | '$' | ','
;   | '_' | '.' | '!' | '~' | '*' | ''' | '(' | ')' | '[' | ']'

(define (yaml-parser-parse!/ns-uri-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-uri-char"))
  (any     (all     (chr #\%)
          yaml-parser-parse!/ns-hex-digit
          yaml-parser-parse!/ns-hex-digit)
      yaml-parser-parse!/ns-word-char
      (chr #\#)
      (chr #\;)
      (chr #\/)
      (chr #\?)
      (chr #\:)
      (chr #\@)
      (chr #\&)
      (chr #\=)
      (chr #\+)
      (chr #\$)
      (chr #\,)
      (chr #\_)
      (chr #\.)
      (chr #\!)
      (chr #\~)
      (chr #\*)
      (chr #\')
      (chr #\()
      (chr #\))
      (chr #\[)
      (chr #\])))



; [040]
; ns-tag-char ::=
;   ns-uri-char - '!' - c-flow-indicator

(define (yaml-parser-parse!/ns-tag-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-tag-char"))
  (but     yaml-parser-parse!/ns-uri-char
      (chr #\!)
      yaml-parser-parse!/c-flow-indicator))



; [041]
; c-escape ::=
;   '\'

(define (yaml-parser-parse!/c-escape self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-escape"))
  (chr #\\))



; [042]
; ns-esc-null ::=
;   '0'

(define (yaml-parser-parse!/ns-esc-null self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-null"))
  (chr #\0))



; [043]
; ns-esc-bell ::=
;   'a'

(define (yaml-parser-parse!/ns-esc-bell self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-bell"))
  (chr #\a))



; [044]
; ns-esc-backspace ::=
;   'b'

(define (yaml-parser-parse!/ns-esc-backspace self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-backspace"))
  (chr #\b))



; [045]
; ns-esc-horizontal-tab ::=
;   't' | x:9

(define (yaml-parser-parse!/ns-esc-horizontal-tab self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-horizontal-tab"))
  (any     (chr #\t)
      (chr #\x09)))



; [046]
; ns-esc-line-feed ::=
;   'n'

(define (yaml-parser-parse!/ns-esc-line-feed self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-line-feed"))
  (chr #\n))



; [047]
; ns-esc-vertical-tab ::=
;   'v'

(define (yaml-parser-parse!/ns-esc-vertical-tab self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-vertical-tab"))
  (chr #\v))



; [048]
; ns-esc-form-feed ::=
;   'f'

(define (yaml-parser-parse!/ns-esc-form-feed self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-form-feed"))
  (chr #\f))



; [049]
; ns-esc-carriage-return ::=
;   'r'

(define (yaml-parser-parse!/ns-esc-carriage-return self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-carriage-return"))
  (chr #\r))



; [050]
; ns-esc-escape ::=
;   'e'

(define (yaml-parser-parse!/ns-esc-escape self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-escape"))
  (chr #\e))



; [051]
; ns-esc-space ::=
;   x:20

(define (yaml-parser-parse!/ns-esc-space self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-space"))
  (chr #\x20))



; [052]
; ns-esc-double-quote ::=
;   '"'

(define (yaml-parser-parse!/ns-esc-double-quote self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-double-quote"))
  (chr #\"))



; [053]
; ns-esc-slash ::=
;   '/'

(define (yaml-parser-parse!/ns-esc-slash self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-slash"))
  (chr #\/))



; [054]
; ns-esc-backslash ::=
;   '\'

(define (yaml-parser-parse!/ns-esc-backslash self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-backslash"))
  (chr #\\))



; [055]
; ns-esc-next-line ::=
;   'N'

(define (yaml-parser-parse!/ns-esc-next-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-next-line"))
  (chr #\N))



; [056]
; ns-esc-non-breaking-space ::=
;   '_'

(define (yaml-parser-parse!/ns-esc-non-breaking-space self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-non-breaking-space"))
  (chr #\_))



; [057]
; ns-esc-line-separator ::=
;   'L'

(define (yaml-parser-parse!/ns-esc-line-separator self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-line-separator"))
  (chr #\L))



; [058]
; ns-esc-paragraph-separator ::=
;   'P'

(define (yaml-parser-parse!/ns-esc-paragraph-separator self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-paragraph-separator"))
  (chr #\P))



; [059]
; ns-esc-8-bit ::=
;   'x'
;   ( ns-hex-digit{2} )

(define (yaml-parser-parse!/ns-esc-8-bit self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-8-bit"))
  (all     (chr #\x)
      (rep 2 2 yaml-parser-parse!/ns-hex-digit)))



; [060]
; ns-esc-16-bit ::=
;   'u'
;   ( ns-hex-digit{4} )

(define (yaml-parser-parse!/ns-esc-16-bit self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-16-bit"))
  (all     (chr #\u)
      (rep 4 4 yaml-parser-parse!/ns-hex-digit)))



; [061]
; ns-esc-32-bit ::=
;   'U'
;   ( ns-hex-digit{8} )

(define (yaml-parser-parse!/ns-esc-32-bit self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-esc-32-bit"))
  (all     (chr #\U)
      (rep 8 8 yaml-parser-parse!/ns-hex-digit)))



; [062]
; c-ns-esc-char ::=
;   '\'
;   ( ns-esc-null | ns-esc-bell | ns-esc-backspace
;   | ns-esc-horizontal-tab | ns-esc-line-feed
;   | ns-esc-vertical-tab | ns-esc-form-feed
;   | ns-esc-carriage-return | ns-esc-escape | ns-esc-space
;   | ns-esc-double-quote | ns-esc-slash | ns-esc-backslash
;   | ns-esc-next-line | ns-esc-non-breaking-space
;   | ns-esc-line-separator | ns-esc-paragraph-separator
;   | ns-esc-8-bit | ns-esc-16-bit | ns-esc-32-bit )

(define (yaml-parser-parse!/c-ns-esc-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-esc-char"))
  (all     (chr #\\)
      (any     yaml-parser-parse!/ns-esc-null
          yaml-parser-parse!/ns-esc-bell
          yaml-parser-parse!/ns-esc-backspace
          yaml-parser-parse!/ns-esc-horizontal-tab
          yaml-parser-parse!/ns-esc-line-feed
          yaml-parser-parse!/ns-esc-vertical-tab
          yaml-parser-parse!/ns-esc-form-feed
          yaml-parser-parse!/ns-esc-carriage-return
          yaml-parser-parse!/ns-esc-escape
          yaml-parser-parse!/ns-esc-space
          yaml-parser-parse!/ns-esc-double-quote
          yaml-parser-parse!/ns-esc-slash
          yaml-parser-parse!/ns-esc-backslash
          yaml-parser-parse!/ns-esc-next-line
          yaml-parser-parse!/ns-esc-non-breaking-space
          yaml-parser-parse!/ns-esc-line-separator
          yaml-parser-parse!/ns-esc-paragraph-separator
          yaml-parser-parse!/ns-esc-8-bit
          yaml-parser-parse!/ns-esc-16-bit
          yaml-parser-parse!/ns-esc-32-bit)))



; [063]
; s-indent(n) ::=
;   s-space{n}

(define (yaml-parser-parse!/s-indent self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-indent",n))
  (rep n n yaml-parser-parse!/s-space))



; [064]
; s-indent(<n) ::=
;   s-space{m} <where_m_<_n>

(define (yaml-parser-parse!/s-indent-lt self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-indent-lt",n))
  (may   (all     (rep 0 #f yaml-parser-parse!/s-space)
        (lt (len match) n))))



; [065]
; s-indent(<=n) ::=
;   s-space{m} <where_m_<=_n>

(define (yaml-parser-parse!/s-indent-le self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-indent-le",n))
  (may   (all     (rep 0 #f yaml-parser-parse!/s-space)
        (le (len match) n))))



; [066]
; s-separate-in-line ::=
;   s-white+ | <start_of_line>

(define (yaml-parser-parse!/s-separate-in-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-separate-in-line"))
  (any     (rep 1 #f yaml-parser-parse!/s-white)
      yaml-parser-parse!/start-of-line))



; [067]
; s-line-prefix(n,c) ::=
;   ( c = block-out => s-block-line-prefix(n) )
;   ( c = block-in => s-block-line-prefix(n) )
;   ( c = flow-out => s-flow-line-prefix(n) )
;   ( c = flow-in => s-flow-line-prefix(n) )

(define (yaml-parser-parse!/s-line-prefix self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-line-prefix",nc))
  (parse-case   c
    '(
      (block-in . (yaml-parser-parse!/s-block-line-prefix n))
      (block-out . (yaml-parser-parse!/s-block-line-prefix n))
      (flow-in . (yaml-parser-parse!/s-flow-line-prefix n))
      (flow-out . (yaml-parser-parse!/s-flow-line-prefix n))
    )))



; [068]
; s-block-line-prefix(n) ::=
;   s-indent(n)

(define (yaml-parser-parse!/s-block-line-prefix self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-block-line-prefix",n))
  (yaml-parser-parse!/s-indent n))



; [069]
; s-flow-line-prefix(n) ::=
;   s-indent(n)
;   s-separate-in-line?

(define (yaml-parser-parse!/s-flow-line-prefix self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-flow-line-prefix",n))
  (all     (yaml-parser-parse!/s-indent n)
      (rep 0 1 yaml-parser-parse!/s-separate-in-line)))



; [070]
; l-empty(n,c) ::=
;   ( s-line-prefix(n,c) | s-indent(<n) )
;   b-as-line-feed

(define (yaml-parser-parse!/l-empty self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-empty",nc))
  (all     (any     (yaml-parser-parse!/s-line-prefix n c)
          (yaml-parser-parse!/s-indent-lt n))
      yaml-parser-parse!/b-as-line-feed))



; [071]
; b-l-trimmed(n,c) ::=
;   b-non-content l-empty(n,c)+

(define (yaml-parser-parse!/b-l-trimmed self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-l-trimmed",nc))
  (all     yaml-parser-parse!/b-non-content
      (rep 1 #f (yaml-parser-parse!/l-empty n c))))



; [072]
; b-as-space ::=
;   b-break

(define (yaml-parser-parse!/b-as-space self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-as-space"))
  yaml-parser-parse!/b-break)



; [073]
; b-l-folded(n,c) ::=
;   b-l-trimmed(n,c) | b-as-space

(define (yaml-parser-parse!/b-l-folded self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-l-folded",nc))
  (any     (yaml-parser-parse!/b-l-trimmed n c)
      yaml-parser-parse!/b-as-space))



; [074]
; s-flow-folded(n) ::=
;   s-separate-in-line?
;   b-l-folded(n,flow-in)
;   s-flow-line-prefix(n)

(define (yaml-parser-parse!/s-flow-folded self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-flow-folded",n))
  (all     (rep 0 1 yaml-parser-parse!/s-separate-in-line)
      (yaml-parser-parse!/b-l-folded n "flow-in")
      (yaml-parser-parse!/s-flow-line-prefix n)))



; [075]
; c-nb-comment-text ::=
;   '#' nb-char*

(define (yaml-parser-parse!/c-nb-comment-text self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-nb-comment-text"))
  (all     (chr #\#)
      (rep 0 #f yaml-parser-parse!/nb-char)))



; [076]
; b-comment ::=
;   b-non-content | <end_of_file>

(define (yaml-parser-parse!/b-comment self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-comment"))
  (any     yaml-parser-parse!/b-non-content
      yaml-parser-parse!/end-of-stream))



; [077]
; s-b-comment ::=
;   ( s-separate-in-line
;   c-nb-comment-text? )?
;   b-comment

(define (yaml-parser-parse!/s-b-comment self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-b-comment"))
  (all     (rep   0
        1
        (all     yaml-parser-parse!/s-separate-in-line
            (rep 0 1 yaml-parser-parse!/c-nb-comment-text)))
      yaml-parser-parse!/b-comment))



; [078]
; l-comment ::=
;   s-separate-in-line c-nb-comment-text?
;   b-comment

(define (yaml-parser-parse!/l-comment self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-comment"))
  (all     yaml-parser-parse!/s-separate-in-line
      (rep 0 1 yaml-parser-parse!/c-nb-comment-text)
      yaml-parser-parse!/b-comment))



; [079]
; s-l-comments ::=
;   ( s-b-comment | <start_of_line> )
;   l-comment*

(define (yaml-parser-parse!/s-l-comments self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l-comments"))
  (all     (any     yaml-parser-parse!/s-b-comment
          yaml-parser-parse!/start-of-line)
      (rep 0 #f yaml-parser-parse!/l-comment)))



; [080]
; s-separate(n,c) ::=
;   ( c = block-out => s-separate-lines(n) )
;   ( c = block-in => s-separate-lines(n) )
;   ( c = flow-out => s-separate-lines(n) )
;   ( c = flow-in => s-separate-lines(n) )
;   ( c = block-key => s-separate-in-line )
;   ( c = flow-key => s-separate-in-line )

(define (yaml-parser-parse!/s-separate self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-separate",nc))
  (parse-case   c
    '(
      (block-in . (yaml-parser-parse!/s-separate-lines n))
      (block-key . yaml-parser-parse!/s-separate-in-line)
      (block-out . (yaml-parser-parse!/s-separate-lines n))
      (flow-in . (yaml-parser-parse!/s-separate-lines n))
      (flow-key . yaml-parser-parse!/s-separate-in-line)
      (flow-out . (yaml-parser-parse!/s-separate-lines n))
    )))



; [081]
; s-separate-lines(n) ::=
;   ( s-l-comments
;   s-flow-line-prefix(n) )
;   | s-separate-in-line

(define (yaml-parser-parse!/s-separate-lines self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-separate-lines",n))
  (any     (all     yaml-parser-parse!/s-l-comments
          (yaml-parser-parse!/s-flow-line-prefix n))
      yaml-parser-parse!/s-separate-in-line))



; [082]
; l-directive ::=
;   '%'
;   ( ns-yaml-directive
;   | ns-tag-directive
;   | ns-reserved-directive )
;   s-l-comments

(define (yaml-parser-parse!/l-directive self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-directive"))
  (all     (chr #\%)
      (any     yaml-parser-parse!/ns-yaml-directive
          yaml-parser-parse!/ns-tag-directive
          yaml-parser-parse!/ns-reserved-directive)
      yaml-parser-parse!/s-l-comments))



; [083]
; ns-reserved-directive ::=
;   ns-directive-name
;   ( s-separate-in-line ns-directive-parameter )*

(define (yaml-parser-parse!/ns-reserved-directive self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-reserved-directive"))
  (all     yaml-parser-parse!/ns-directive-name
      (rep   0
        #f
        (all     yaml-parser-parse!/s-separate-in-line
            yaml-parser-parse!/ns-directive-parameter))))



; [084]
; ns-directive-name ::=
;   ns-char+

(define (yaml-parser-parse!/ns-directive-name self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-directive-name"))
  (rep 1 #f yaml-parser-parse!/ns-char))



; [085]
; ns-directive-parameter ::=
;   ns-char+

(define (yaml-parser-parse!/ns-directive-parameter self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-directive-parameter"))
  (rep 1 #f yaml-parser-parse!/ns-char))



; [086]
; ns-yaml-directive ::=
;   'Y' 'A' 'M' 'L'
;   s-separate-in-line ns-yaml-version

(define (yaml-parser-parse!/ns-yaml-directive self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-yaml-directive"))
  (all     (chr #\Y)
      (chr #\A)
      (chr #\M)
      (chr #\L)
      yaml-parser-parse!/s-separate-in-line
      yaml-parser-parse!/ns-yaml-version))



; [087]
; ns-yaml-version ::=
;   ns-dec-digit+ '.' ns-dec-digit+

(define (yaml-parser-parse!/ns-yaml-version self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-yaml-version"))
  (all     (rep 1 #f yaml-parser-parse!/ns-dec-digit)
      (chr #\.)
      (rep 1 #f yaml-parser-parse!/ns-dec-digit)))



; [088]
; ns-tag-directive ::=
;   'T' 'A' 'G'
;   s-separate-in-line c-tag-handle
;   s-separate-in-line ns-tag-prefix

(define (yaml-parser-parse!/ns-tag-directive self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-tag-directive"))
  (all     (chr #\T)
      (chr #\A)
      (chr #\G)
      yaml-parser-parse!/s-separate-in-line
      yaml-parser-parse!/c-tag-handle
      yaml-parser-parse!/s-separate-in-line
      yaml-parser-parse!/ns-tag-prefix))



; [089]
; c-tag-handle ::=
;   c-named-tag-handle
;   | c-secondary-tag-handle
;   | c-primary-tag-handle

(define (yaml-parser-parse!/c-tag-handle self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-tag-handle"))
  (any     yaml-parser-parse!/c-named-tag-handle
      yaml-parser-parse!/c-secondary-tag-handle
      yaml-parser-parse!/c-primary-tag-handle))



; [090]
; c-primary-tag-handle ::=
;   '!'

(define (yaml-parser-parse!/c-primary-tag-handle self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-primary-tag-handle"))
  (chr #\!))



; [091]
; c-secondary-tag-handle ::=
;   '!' '!'

(define (yaml-parser-parse!/c-secondary-tag-handle self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-secondary-tag-handle"))
  (all     (chr #\!)
      (chr #\!)))



; [092]
; c-named-tag-handle ::=
;   '!' ns-word-char+ '!'

(define (yaml-parser-parse!/c-named-tag-handle self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-named-tag-handle"))
  (all     (chr #\!)
      (rep 1 #f yaml-parser-parse!/ns-word-char)
      (chr #\!)))



; [093]
; ns-tag-prefix ::=
;   c-ns-local-tag-prefix | ns-global-tag-prefix

(define (yaml-parser-parse!/ns-tag-prefix self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-tag-prefix"))
  (any     yaml-parser-parse!/c-ns-local-tag-prefix
      yaml-parser-parse!/ns-global-tag-prefix))



; [094]
; c-ns-local-tag-prefix ::=
;   '!' ns-uri-char*

(define (yaml-parser-parse!/c-ns-local-tag-prefix self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-local-tag-prefix"))
  (all     (chr #\!)
      (rep 0 #f yaml-parser-parse!/ns-uri-char)))



; [095]
; ns-global-tag-prefix ::=
;   ns-tag-char ns-uri-char*

(define (yaml-parser-parse!/ns-global-tag-prefix self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-global-tag-prefix"))
  (all     yaml-parser-parse!/ns-tag-char
      (rep 0 #f yaml-parser-parse!/ns-uri-char)))



; [096]
; c-ns-properties(n,c) ::=
;   ( c-ns-tag-property
;   ( s-separate(n,c) c-ns-anchor-property )? )
;   | ( c-ns-anchor-property
;   ( s-separate(n,c) c-ns-tag-property )? )

(define (yaml-parser-parse!/c-ns-properties self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-properties",nc))
  (any     (all     yaml-parser-parse!/c-ns-tag-property
          (rep   0
            1
            (all     (yaml-parser-parse!/s-separate n c)
                yaml-parser-parse!/c-ns-anchor-property)))
      (all     yaml-parser-parse!/c-ns-anchor-property
          (rep   0
            1
            (all     (yaml-parser-parse!/s-separate n c)
                yaml-parser-parse!/c-ns-tag-property)))))



; [097]
; c-ns-tag-property ::=
;   c-verbatim-tag
;   | c-ns-shorthand-tag
;   | c-non-specific-tag

(define (yaml-parser-parse!/c-ns-tag-property self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-tag-property"))
  (any     yaml-parser-parse!/c-verbatim-tag
      yaml-parser-parse!/c-ns-shorthand-tag
      yaml-parser-parse!/c-non-specific-tag))



; [098]
; c-verbatim-tag ::=
;   '!' '<' ns-uri-char+ '>'

(define (yaml-parser-parse!/c-verbatim-tag self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-verbatim-tag"))
  (all     (chr #\!)
      (chr #\<)
      (rep 1 #f yaml-parser-parse!/ns-uri-char)
      (chr #\>)))



; [099]
; c-ns-shorthand-tag ::=
;   c-tag-handle ns-tag-char+

(define (yaml-parser-parse!/c-ns-shorthand-tag self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-shorthand-tag"))
  (all     yaml-parser-parse!/c-tag-handle
      (rep 1 #f yaml-parser-parse!/ns-tag-char)))



; [100]
; c-non-specific-tag ::=
;   '!'

(define (yaml-parser-parse!/c-non-specific-tag self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-non-specific-tag"))
  (chr #\!))



; [101]
; c-ns-anchor-property ::=
;   '&' ns-anchor-name

(define (yaml-parser-parse!/c-ns-anchor-property self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-anchor-property"))
  (all     (chr #\&)
      yaml-parser-parse!/ns-anchor-name))



; [102]
; ns-anchor-char ::=
;   ns-char - c-flow-indicator

(define (yaml-parser-parse!/ns-anchor-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-anchor-char"))
  (but     yaml-parser-parse!/ns-char
      yaml-parser-parse!/c-flow-indicator))



; [103]
; ns-anchor-name ::=
;   ns-anchor-char+

(define (yaml-parser-parse!/ns-anchor-name self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-anchor-name"))
  (rep 1 #f yaml-parser-parse!/ns-anchor-char))



; [104]
; c-ns-alias-node ::=
;   '*' ns-anchor-name

(define (yaml-parser-parse!/c-ns-alias-node self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-alias-node"))
  (all     (chr #\*)
      yaml-parser-parse!/ns-anchor-name))



; [105]
; e-scalar ::=
;   <empty>

(define (yaml-parser-parse!/e-scalar self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/e-scalar"))
  yaml-parser-parse!/empty)



; [106]
; e-node ::=
;   e-scalar

(define (yaml-parser-parse!/e-node self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/e-node"))
  yaml-parser-parse!/e-scalar)



; [107]
; nb-double-char ::=
;   c-ns-esc-char | ( nb-json - '\' - '"' )

(define (yaml-parser-parse!/nb-double-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-double-char"))
  (any     yaml-parser-parse!/c-ns-esc-char
      (but     yaml-parser-parse!/nb-json
          (chr #\\)
          (chr #\"))))



; [108]
; ns-double-char ::=
;   nb-double-char - s-white

(define (yaml-parser-parse!/ns-double-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-double-char"))
  (but     yaml-parser-parse!/nb-double-char
      yaml-parser-parse!/s-white))



; [109]
; c-double-quoted(n,c) ::=
;   '"' nb-double-text(n,c)
;   '"'

(define (yaml-parser-parse!/c-double-quoted self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-double-quoted",nc))
  (all     (chr #\")
      (yaml-parser-parse!/nb-double-text n c)
      (chr #\")))



; [110]
; nb-double-text(n,c) ::=
;   ( c = flow-out => nb-double-multi-line(n) )
;   ( c = flow-in => nb-double-multi-line(n) )
;   ( c = block-key => nb-double-one-line )
;   ( c = flow-key => nb-double-one-line )

(define (yaml-parser-parse!/nb-double-text self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-double-text",nc))
  (parse-case   c
    '(
      (block-key . yaml-parser-parse!/nb-double-one-line)
      (flow-in . (yaml-parser-parse!/nb-double-multi-line n))
      (flow-key . yaml-parser-parse!/nb-double-one-line)
      (flow-out . (yaml-parser-parse!/nb-double-multi-line n))
    )))



; [111]
; nb-double-one-line ::=
;   nb-double-char*

(define (yaml-parser-parse!/nb-double-one-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-double-one-line"))
  (rep 0 #f yaml-parser-parse!/nb-double-char))



; [112]
; s-double-escaped(n) ::=
;   s-white* '\'
;   b-non-content
;   l-empty(n,flow-in)* s-flow-line-prefix(n)

(define (yaml-parser-parse!/s-double-escaped self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-double-escaped",n))
  (all     (rep 0 #f yaml-parser-parse!/s-white)
      (chr #\\)
      yaml-parser-parse!/b-non-content
      (rep 0 #f (yaml-parser-parse!/l-empty n "flow-in"))
      (yaml-parser-parse!/s-flow-line-prefix n)))



; [113]
; s-double-break(n) ::=
;   s-double-escaped(n) | s-flow-folded(n)

(define (yaml-parser-parse!/s-double-break self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-double-break",n))
  (any     (yaml-parser-parse!/s-double-escaped n)
      (yaml-parser-parse!/s-flow-folded n)))



; [114]
; nb-ns-double-in-line ::=
;   ( s-white* ns-double-char )*

(define (yaml-parser-parse!/nb-ns-double-in-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-ns-double-in-line"))
  (rep   0
    #f
    (all     (rep 0 #f yaml-parser-parse!/s-white)
        yaml-parser-parse!/ns-double-char)))



; [115]
; s-double-next-line(n) ::=
;   s-double-break(n)
;   ( ns-double-char nb-ns-double-in-line
;   ( s-double-next-line(n) | s-white* ) )?

(define (yaml-parser-parse!/s-double-next-line self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-double-next-line",n))
  (all     (yaml-parser-parse!/s-double-break n)
      (rep   0
        1
        (all     yaml-parser-parse!/ns-double-char
            yaml-parser-parse!/nb-ns-double-in-line
            (any     (yaml-parser-parse!/s-double-next-line n)
                (rep 0 #f yaml-parser-parse!/s-white))))))



; [116]
; nb-double-multi-line(n) ::=
;   nb-ns-double-in-line
;   ( s-double-next-line(n) | s-white* )

(define (yaml-parser-parse!/nb-double-multi-line self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-double-multi-line",n))
  (all     yaml-parser-parse!/nb-ns-double-in-line
      (any     (yaml-parser-parse!/s-double-next-line n)
          (rep 0 #f yaml-parser-parse!/s-white))))



; [117]
; c-quoted-quote ::=
;   ''' '''

(define (yaml-parser-parse!/c-quoted-quote self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-quoted-quote"))
  (all     (chr #\')
      (chr #\')))



; [118]
; nb-single-char ::=
;   c-quoted-quote | ( nb-json - ''' )

(define (yaml-parser-parse!/nb-single-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-single-char"))
  (any     yaml-parser-parse!/c-quoted-quote
      (but     yaml-parser-parse!/nb-json
          (chr #\'))))



; [119]
; ns-single-char ::=
;   nb-single-char - s-white

(define (yaml-parser-parse!/ns-single-char self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-single-char"))
  (but     yaml-parser-parse!/nb-single-char
      yaml-parser-parse!/s-white))



; [120]
; c-single-quoted(n,c) ::=
;   ''' nb-single-text(n,c)
;   '''

(define (yaml-parser-parse!/c-single-quoted self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-single-quoted",nc))
  (all     (chr #\')
      (yaml-parser-parse!/nb-single-text n c)
      (chr #\')))



; [121]
; nb-single-text(n,c) ::=
;   ( c = flow-out => nb-single-multi-line(n) )
;   ( c = flow-in => nb-single-multi-line(n) )
;   ( c = block-key => nb-single-one-line )
;   ( c = flow-key => nb-single-one-line )

(define (yaml-parser-parse!/nb-single-text self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-single-text",nc))
  (parse-case   c
    '(
      (block-key . yaml-parser-parse!/nb-single-one-line)
      (flow-in . (yaml-parser-parse!/nb-single-multi-line n))
      (flow-key . yaml-parser-parse!/nb-single-one-line)
      (flow-out . (yaml-parser-parse!/nb-single-multi-line n))
    )))



; [122]
; nb-single-one-line ::=
;   nb-single-char*

(define (yaml-parser-parse!/nb-single-one-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-single-one-line"))
  (rep 0 #f yaml-parser-parse!/nb-single-char))



; [123]
; nb-ns-single-in-line ::=
;   ( s-white* ns-single-char )*

(define (yaml-parser-parse!/nb-ns-single-in-line self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-ns-single-in-line"))
  (rep   0
    #f
    (all     (rep 0 #f yaml-parser-parse!/s-white)
        yaml-parser-parse!/ns-single-char)))



; [124]
; s-single-next-line(n) ::=
;   s-flow-folded(n)
;   ( ns-single-char nb-ns-single-in-line
;   ( s-single-next-line(n) | s-white* ) )?

(define (yaml-parser-parse!/s-single-next-line self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-single-next-line",n))
  (all     (yaml-parser-parse!/s-flow-folded n)
      (rep   0
        1
        (all     yaml-parser-parse!/ns-single-char
            yaml-parser-parse!/nb-ns-single-in-line
            (any     (yaml-parser-parse!/s-single-next-line n)
                (rep 0 #f yaml-parser-parse!/s-white))))))



; [125]
; nb-single-multi-line(n) ::=
;   nb-ns-single-in-line
;   ( s-single-next-line(n) | s-white* )

(define (yaml-parser-parse!/nb-single-multi-line self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-single-multi-line",n))
  (all     yaml-parser-parse!/nb-ns-single-in-line
      (any     (yaml-parser-parse!/s-single-next-line n)
          (rep 0 #f yaml-parser-parse!/s-white))))



; [126]
; ns-plain-first(c) ::=
;   ( ns-char - c-indicator )
;   | ( ( '?' | ':' | '-' )
;   <followed_by_an_ns-plain-safe(c)> )

(define (yaml-parser-parse!/ns-plain-first self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-first",c))
  (any     (but     yaml-parser-parse!/ns-char
          yaml-parser-parse!/c-indicator)
      (all     (any     (chr #\?)
              (chr #\:)
              (chr #\-))
          (chk '=' (yaml-parser-parse!/ns-plain-safe c)))))



; [127]
; ns-plain-safe(c) ::=
;   ( c = flow-out => ns-plain-safe-out )
;   ( c = flow-in => ns-plain-safe-in )
;   ( c = block-key => ns-plain-safe-out )
;   ( c = flow-key => ns-plain-safe-in )

(define (yaml-parser-parse!/ns-plain-safe self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-safe",c))
  (parse-case   c
    '(
      (block-key . yaml-parser-parse!/ns-plain-safe-out)
      (flow-in . yaml-parser-parse!/ns-plain-safe-in)
      (flow-key . yaml-parser-parse!/ns-plain-safe-in)
      (flow-out . yaml-parser-parse!/ns-plain-safe-out)
    )))



; [128]
; ns-plain-safe-out ::=
;   ns-char

(define (yaml-parser-parse!/ns-plain-safe-out self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-safe-out"))
  yaml-parser-parse!/ns-char)



; [129]
; ns-plain-safe-in ::=
;   ns-char - c-flow-indicator

(define (yaml-parser-parse!/ns-plain-safe-in self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-safe-in"))
  (but     yaml-parser-parse!/ns-char
      yaml-parser-parse!/c-flow-indicator))



; [130]
; ns-plain-char(c) ::=
;   ( ns-plain-safe(c) - ':' - '#' )
;   | ( <an_ns-char_preceding> '#' )
;   | ( ':' <followed_by_an_ns-plain-safe(c)> )

(define (yaml-parser-parse!/ns-plain-char self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-char",c))
  (any     (but     (yaml-parser-parse!/ns-plain-safe c)
          (chr #\:)
          (chr #\#))
      (all     (chk '<=' yaml-parser-parse!/ns-char)
          (chr #\#))
      (all     (chr #\:)
          (chk '=' (yaml-parser-parse!/ns-plain-safe c)))))



; [131]
; ns-plain(n,c) ::=
;   ( c = flow-out => ns-plain-multi-line(n,c) )
;   ( c = flow-in => ns-plain-multi-line(n,c) )
;   ( c = block-key => ns-plain-one-line(c) )
;   ( c = flow-key => ns-plain-one-line(c) )

(define (yaml-parser-parse!/ns-plain self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain",nc))
  (parse-case   c
    '(
      (block-key . (yaml-parser-parse!/ns-plain-one-line c))
      (flow-in . (yaml-parser-parse!/ns-plain-multi-line n c))
      (flow-key . (yaml-parser-parse!/ns-plain-one-line c))
      (flow-out . (yaml-parser-parse!/ns-plain-multi-line n c))
    )))



; [132]
; nb-ns-plain-in-line(c) ::=
;   ( s-white*
;   ns-plain-char(c) )*

(define (yaml-parser-parse!/nb-ns-plain-in-line self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/nb-ns-plain-in-line",c))
  (rep   0
    #f
    (all     (rep 0 #f yaml-parser-parse!/s-white)
        (yaml-parser-parse!/ns-plain-char c))))



; [133]
; ns-plain-one-line(c) ::=
;   ns-plain-first(c)
;   nb-ns-plain-in-line(c)

(define (yaml-parser-parse!/ns-plain-one-line self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-one-line",c))
  (all     (yaml-parser-parse!/ns-plain-first c)
      (yaml-parser-parse!/nb-ns-plain-in-line c)))



; [134]
; s-ns-plain-next-line(n,c) ::=
;   s-flow-folded(n)
;   ns-plain-char(c) nb-ns-plain-in-line(c)

(define (yaml-parser-parse!/s-ns-plain-next-line self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-ns-plain-next-line",nc))
  (all     (yaml-parser-parse!/s-flow-folded n)
      (yaml-parser-parse!/ns-plain-char c)
      (yaml-parser-parse!/nb-ns-plain-in-line c)))



; [135]
; ns-plain-multi-line(n,c) ::=
;   ns-plain-one-line(c)
;   s-ns-plain-next-line(n,c)*

(define (yaml-parser-parse!/ns-plain-multi-line self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-plain-multi-line",nc))
  (all     (yaml-parser-parse!/ns-plain-one-line c)
      (rep 0 #f (yaml-parser-parse!/s-ns-plain-next-line n c))))



; [136]
; in-flow(c) ::=
;   ( c = flow-out => flow-in )
;   ( c = flow-in => flow-in )
;   ( c = block-key => flow-key )
;   ( c = flow-key => flow-key )

(define (yaml-parser-parse!/in-flow self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/in-flow",c))
  (flip   c
    {
      'block-key' => "flow-key",
      'flow-in' => "flow-in",
      'flow-key' => "flow-key",
      'flow-out' => "flow-in",
    }))



; [137]
; c-flow-sequence(n,c) ::=
;   '[' s-separate(n,c)?
;   ns-s-flow-seq-entries(n,in-flow(c))? ']'

(define (yaml-parser-parse!/c-flow-sequence self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-flow-sequence",nc))
  (all     (chr #\[)
      (rep 0 1 (yaml-parser-parse!/s-separate n c))
      (rep 0 1 (yaml-parser-parse!/ns-s-flow-seq-entries n (yaml-parser-parse!/in-flow c)))
      (chr #\])))



; [138]
; ns-s-flow-seq-entries(n,c) ::=
;   ns-flow-seq-entry(n,c)
;   s-separate(n,c)?
;   ( ',' s-separate(n,c)?
;   ns-s-flow-seq-entries(n,c)? )?

(define (yaml-parser-parse!/ns-s-flow-seq-entries self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-s-flow-seq-entries",nc))
  (all     (yaml-parser-parse!/ns-flow-seq-entry n c)
      (rep 0 1 (yaml-parser-parse!/s-separate n c))
      (rep   0
        1
        (all     (chr #\,)
            (rep 0 1 (yaml-parser-parse!/s-separate n c))
            (rep 0 1 (yaml-parser-parse!/ns-s-flow-seq-entries n c))))))



; [139]
; ns-flow-seq-entry(n,c) ::=
;   ns-flow-pair(n,c) | ns-flow-node(n,c)

(define (yaml-parser-parse!/ns-flow-seq-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-seq-entry",nc))
  (any     (yaml-parser-parse!/ns-flow-pair n c)
      (yaml-parser-parse!/ns-flow-node n c)))



; [140]
; c-flow-mapping(n,c) ::=
;   '{' s-separate(n,c)?
;   ns-s-flow-map-entries(n,in-flow(c))? '}'

(define (yaml-parser-parse!/c-flow-mapping self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-flow-mapping",nc))
  (all     (chr #\{)
      (rep 0 1 (yaml-parser-parse!/s-separate n c))
      (rep 0 1 (yaml-parser-parse!/ns-s-flow-map-entries n (yaml-parser-parse!/in-flow c)))
      (chr #\})))



; [141]
; ns-s-flow-map-entries(n,c) ::=
;   ns-flow-map-entry(n,c)
;   s-separate(n,c)?
;   ( ',' s-separate(n,c)?
;   ns-s-flow-map-entries(n,c)? )?

(define (yaml-parser-parse!/ns-s-flow-map-entries self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-s-flow-map-entries",nc))
  (all     (yaml-parser-parse!/ns-flow-map-entry n c)
      (rep 0 1 (yaml-parser-parse!/s-separate n c))
      (rep   0
        1
        (all     (chr #\,)
            (rep 0 1 (yaml-parser-parse!/s-separate n c))
            (rep 0 1 (yaml-parser-parse!/ns-s-flow-map-entries n c))))))



; [142]
; ns-flow-map-entry(n,c) ::=
;   ( '?' s-separate(n,c)
;   ns-flow-map-explicit-entry(n,c) )
;   | ns-flow-map-implicit-entry(n,c)

(define (yaml-parser-parse!/ns-flow-map-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-map-entry",nc))
  (any     (all     (chr #\?)
          (chk   '='
            (any     yaml-parser-parse!/end-of-stream
                yaml-parser-parse!/s-white
                yaml-parser-parse!/b-break))
          (yaml-parser-parse!/s-separate n c)
          (yaml-parser-parse!/ns-flow-map-explicit-entry n c))
      (yaml-parser-parse!/ns-flow-map-implicit-entry n c)))



; [143]
; ns-flow-map-explicit-entry(n,c) ::=
;   ns-flow-map-implicit-entry(n,c)
;   | ( e-node
;   e-node )

(define (yaml-parser-parse!/ns-flow-map-explicit-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-map-explicit-entry",nc))
  (any     (yaml-parser-parse!/ns-flow-map-implicit-entry n c)
      (all     yaml-parser-parse!/e-node
          yaml-parser-parse!/e-node)))



; [144]
; ns-flow-map-implicit-entry(n,c) ::=
;   ns-flow-map-yaml-key-entry(n,c)
;   | c-ns-flow-map-empty-key-entry(n,c)
;   | c-ns-flow-map-json-key-entry(n,c)

(define (yaml-parser-parse!/ns-flow-map-implicit-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-map-implicit-entry",nc))
  (any     (yaml-parser-parse!/ns-flow-map-yaml-key-entry n c)
      (yaml-parser-parse!/c-ns-flow-map-empty-key-entry n c)
      (yaml-parser-parse!/c-ns-flow-map-json-key-entry n c)))



; [145]
; ns-flow-map-yaml-key-entry(n,c) ::=
;   ns-flow-yaml-node(n,c)
;   ( ( s-separate(n,c)?
;   c-ns-flow-map-separate-value(n,c) )
;   | e-node )

(define (yaml-parser-parse!/ns-flow-map-yaml-key-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-map-yaml-key-entry",nc))
  (all     (yaml-parser-parse!/ns-flow-yaml-node n c)
      (any     (all     (rep 0 1 (yaml-parser-parse!/s-separate n c))
              (yaml-parser-parse!/c-ns-flow-map-separate-value n c))
          yaml-parser-parse!/e-node)))



; [146]
; c-ns-flow-map-empty-key-entry(n,c) ::=
;   e-node
;   c-ns-flow-map-separate-value(n,c)

(define (yaml-parser-parse!/c-ns-flow-map-empty-key-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-flow-map-empty-key-entry",nc))
  (all     yaml-parser-parse!/e-node
      (yaml-parser-parse!/c-ns-flow-map-separate-value n c)))



; [147]
; c-ns-flow-map-separate-value(n,c) ::=
;   ':' <not_followed_by_an_ns-plain-safe(c)>
;   ( ( s-separate(n,c) ns-flow-node(n,c) )
;   | e-node )

(define (yaml-parser-parse!/c-ns-flow-map-separate-value self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-flow-map-separate-value",nc))
  (all     (chr #\:)
      (chk '!' (yaml-parser-parse!/ns-plain-safe c))
      (any     (all     (yaml-parser-parse!/s-separate n c)
              (yaml-parser-parse!/ns-flow-node n c))
          yaml-parser-parse!/e-node)))



; [148]
; c-ns-flow-map-json-key-entry(n,c) ::=
;   c-flow-json-node(n,c)
;   ( ( s-separate(n,c)?
;   c-ns-flow-map-adjacent-value(n,c) )
;   | e-node )

(define (yaml-parser-parse!/c-ns-flow-map-json-key-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-flow-map-json-key-entry",nc))
  (all     (yaml-parser-parse!/c-flow-json-node n c)
      (any     (all     (rep 0 1 (yaml-parser-parse!/s-separate n c))
              (yaml-parser-parse!/c-ns-flow-map-adjacent-value n c))
          yaml-parser-parse!/e-node)))



; [149]
; c-ns-flow-map-adjacent-value(n,c) ::=
;   ':' ( (
;   s-separate(n,c)?
;   ns-flow-node(n,c) )
;   | e-node )

(define (yaml-parser-parse!/c-ns-flow-map-adjacent-value self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-flow-map-adjacent-value",nc))
  (all     (chr #\:)
      (any     (all     (rep 0 1 (yaml-parser-parse!/s-separate n c))
              (yaml-parser-parse!/ns-flow-node n c))
          yaml-parser-parse!/e-node)))



; [150]
; ns-flow-pair(n,c) ::=
;   ( '?' s-separate(n,c)
;   ns-flow-map-explicit-entry(n,c) )
;   | ns-flow-pair-entry(n,c)

(define (yaml-parser-parse!/ns-flow-pair self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-pair",nc))
  (any     (all     (chr #\?)
          (chk   '='
            (any     yaml-parser-parse!/end-of-stream
                yaml-parser-parse!/s-white
                yaml-parser-parse!/b-break))
          (yaml-parser-parse!/s-separate n c)
          (yaml-parser-parse!/ns-flow-map-explicit-entry n c))
      (yaml-parser-parse!/ns-flow-pair-entry n c)))



; [151]
; ns-flow-pair-entry(n,c) ::=
;   ns-flow-pair-yaml-key-entry(n,c)
;   | c-ns-flow-map-empty-key-entry(n,c)
;   | c-ns-flow-pair-json-key-entry(n,c)

(define (yaml-parser-parse!/ns-flow-pair-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-pair-entry",nc))
  (any     (yaml-parser-parse!/ns-flow-pair-yaml-key-entry n c)
      (yaml-parser-parse!/c-ns-flow-map-empty-key-entry n c)
      (yaml-parser-parse!/c-ns-flow-pair-json-key-entry n c)))



; [152]
; ns-flow-pair-yaml-key-entry(n,c) ::=
;   ns-s-implicit-yaml-key(flow-key)
;   c-ns-flow-map-separate-value(n,c)

(define (yaml-parser-parse!/ns-flow-pair-yaml-key-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-pair-yaml-key-entry",nc))
  (all     (yaml-parser-parse!/ns-s-implicit-yaml-key "flow-key")
      (yaml-parser-parse!/c-ns-flow-map-separate-value n c)))



; [153]
; c-ns-flow-pair-json-key-entry(n,c) ::=
;   c-s-implicit-json-key(flow-key)
;   c-ns-flow-map-adjacent-value(n,c)

(define (yaml-parser-parse!/c-ns-flow-pair-json-key-entry self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-ns-flow-pair-json-key-entry",nc))
  (all     (yaml-parser-parse!/c-s-implicit-json-key "flow-key")
      (yaml-parser-parse!/c-ns-flow-map-adjacent-value n c)))



; [154]
; ns-s-implicit-yaml-key(c) ::=
;   ns-flow-yaml-node(n/a,c)
;   s-separate-in-line?
;   <at_most_1024_characters_altogether>

(define (yaml-parser-parse!/ns-s-implicit-yaml-key self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-s-implicit-yaml-key",c))
  (all     (max 1024)
      (yaml-parser-parse!/ns-flow-yaml-node #f c)
      (rep 0 1 yaml-parser-parse!/s-separate-in-line)))



; [155]
; c-s-implicit-json-key(c) ::=
;   c-flow-json-node(n/a,c)
;   s-separate-in-line?
;   <at_most_1024_characters_altogether>

(define (yaml-parser-parse!/c-s-implicit-json-key self c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-s-implicit-json-key",c))
  (all     (max 1024)
      (yaml-parser-parse!/c-flow-json-node #f c)
      (rep 0 1 yaml-parser-parse!/s-separate-in-line)))



; [156]
; ns-flow-yaml-content(n,c) ::=
;   ns-plain(n,c)

(define (yaml-parser-parse!/ns-flow-yaml-content self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-yaml-content",nc))
  (yaml-parser-parse!/ns-plain n c))



; [157]
; c-flow-json-content(n,c) ::=
;   c-flow-sequence(n,c) | c-flow-mapping(n,c)
;   | c-single-quoted(n,c) | c-double-quoted(n,c)

(define (yaml-parser-parse!/c-flow-json-content self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-flow-json-content",nc))
  (any     (yaml-parser-parse!/c-flow-sequence n c)
      (yaml-parser-parse!/c-flow-mapping n c)
      (yaml-parser-parse!/c-single-quoted n c)
      (yaml-parser-parse!/c-double-quoted n c)))



; [158]
; ns-flow-content(n,c) ::=
;   ns-flow-yaml-content(n,c) | c-flow-json-content(n,c)

(define (yaml-parser-parse!/ns-flow-content self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-content",nc))
  (any     (yaml-parser-parse!/ns-flow-yaml-content n c)
      (yaml-parser-parse!/c-flow-json-content n c)))



; [159]
; ns-flow-yaml-node(n,c) ::=
;   c-ns-alias-node
;   | ns-flow-yaml-content(n,c)
;   | ( c-ns-properties(n,c)
;   ( ( s-separate(n,c)
;   ns-flow-yaml-content(n,c) )
;   | e-scalar ) )

(define (yaml-parser-parse!/ns-flow-yaml-node self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-yaml-node",nc))
  (any     yaml-parser-parse!/c-ns-alias-node
      (yaml-parser-parse!/ns-flow-yaml-content n c)
      (all     (yaml-parser-parse!/c-ns-properties n c)
          (any     (all     (yaml-parser-parse!/s-separate n c)
                  (yaml-parser-parse!/ns-flow-content n c))
              yaml-parser-parse!/e-scalar))))



; [160]
; c-flow-json-node(n,c) ::=
;   ( c-ns-properties(n,c)
;   s-separate(n,c) )?
;   c-flow-json-content(n,c)

(define (yaml-parser-parse!/c-flow-json-node self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-flow-json-node",nc))
  (all     (rep   0
        1
        (all     (yaml-parser-parse!/c-ns-properties n c)
            (yaml-parser-parse!/s-separate n c)))
      (yaml-parser-parse!/c-flow-json-content n c)))



; [161]
; ns-flow-node(n,c) ::=
;   c-ns-alias-node
;   | ns-flow-content(n,c)
;   | ( c-ns-properties(n,c)
;   ( ( s-separate(n,c)
;   ns-flow-content(n,c) )
;   | e-scalar ) )

(define (yaml-parser-parse!/ns-flow-node self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-flow-node",nc))
  (any     yaml-parser-parse!/c-ns-alias-node
      (yaml-parser-parse!/ns-flow-content n c)
      (all     (yaml-parser-parse!/c-ns-properties n c)
          (any     (all     (yaml-parser-parse!/s-separate n c)
                  (yaml-parser-parse!/ns-flow-content n c))
              yaml-parser-parse!/e-scalar))))



; [162]
; c-b-block-header(m,t) ::=
;   ( ( c-indentation-indicator(m)
;   c-chomping-indicator(t) )
;   | ( c-chomping-indicator(t)
;   c-indentation-indicator(m) ) )
;   s-b-comment

(define (yaml-parser-parse!/c-b-block-header self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-b-block-header",n))
  (all     (any     (all     (yaml-parser-parse!/c-indentation-indicator n)
              yaml-parser-parse!/c-chomping-indicator
              (chk   '='
                (any     yaml-parser-parse!/end-of-stream
                    yaml-parser-parse!/s-white
                    yaml-parser-parse!/b-break)))
          (all     yaml-parser-parse!/c-chomping-indicator
              (yaml-parser-parse!/c-indentation-indicator n)
              (chk   '='
                (any     yaml-parser-parse!/end-of-stream
                    yaml-parser-parse!/s-white
                    yaml-parser-parse!/b-break))))
      yaml-parser-parse!/s-b-comment))



; [163]
; c-indentation-indicator(m) ::=
;   ( ns-dec-digit => m = ns-dec-digit - x:30 )
;   ( <empty> => m = auto-detect() )

(define (yaml-parser-parse!/c-indentation-indicator self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-indentation-indicator",n))
  (any     (if (rng #\x31 #\x39) (set 'm' (ord match)))
      (if yaml-parser-parse!/empty (set 'm' (yaml-parser-parse!/auto-detect n)))))



; [164]
; c-chomping-indicator(t) ::=
;   ( '-' => t = strip )
;   ( '+' => t = keep )
;   ( <empty> => t = clip )

(define (yaml-parser-parse!/c-chomping-indicator self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-chomping-indicator"))
  (any     (if (chr #\-) (set 't' "strip"))
      (if (chr #\+) (set 't' "keep"))
      (if yaml-parser-parse!/empty (set 't' "clip"))))



; [165]
; b-chomped-last(t) ::=
;   ( t = strip => b-non-content | <end_of_file> )
;   ( t = clip => b-as-line-feed | <end_of_file> )
;   ( t = keep => b-as-line-feed | <end_of_file> )

(define (yaml-parser-parse!/b-chomped-last self t)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-chomped-last",t))
  (parse-case   t
    '(
      (clip . (any yaml-parser-parse!/b-as-line-feed yaml-parser-parse!/end-of-stream))
      (keep . (any yaml-parser-parse!/b-as-line-feed yaml-parser-parse!/end-of-stream))
      (strip . (any yaml-parser-parse!/b-non-content yaml-parser-parse!/end-of-stream))
    )))



; [166]
; l-chomped-empty(n,t) ::=
;   ( t = strip => l-strip-empty(n) )
;   ( t = clip => l-strip-empty(n) )
;   ( t = keep => l-keep-empty(n) )

(define (yaml-parser-parse!/l-chomped-empty self n t)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-chomped-empty",nt))
  (parse-case   t
    '(
      (clip . (yaml-parser-parse!/l-strip-empty n))
      (keep . (yaml-parser-parse!/l-keep-empty n))
      (strip . (yaml-parser-parse!/l-strip-empty n))
    )))



; [167]
; l-strip-empty(n) ::=
;   ( s-indent(<=n) b-non-content )*
;   l-trail-comments(n)?

(define (yaml-parser-parse!/l-strip-empty self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-strip-empty",n))
  (all     (rep   0
        #f
        (all     (yaml-parser-parse!/s-indent-le n)
            yaml-parser-parse!/b-non-content))
      (rep 0 1 (yaml-parser-parse!/l-trail-comments n))))



; [168]
; l-keep-empty(n) ::=
;   l-empty(n,block-in)*
;   l-trail-comments(n)?

(define (yaml-parser-parse!/l-keep-empty self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-keep-empty",n))
  (all     (rep 0 #f (yaml-parser-parse!/l-empty n "block-in"))
      (rep 0 1 (yaml-parser-parse!/l-trail-comments n))))



; [169]
; l-trail-comments(n) ::=
;   s-indent(<n)
;   c-nb-comment-text b-comment
;   l-comment*

(define (yaml-parser-parse!/l-trail-comments self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-trail-comments",n))
  (all     (yaml-parser-parse!/s-indent-lt n)
      yaml-parser-parse!/c-nb-comment-text
      yaml-parser-parse!/b-comment
      (rep 0 #f yaml-parser-parse!/l-comment)))



; [170]
; c-l+literal(n) ::=
;   '|' c-b-block-header(m,t)
;   l-literal-content(n+m,t)

(define (yaml-parser-parse!/c-l+literal self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l+literal",n))
  (all     (chr #\|)
      (yaml-parser-parse!/c-b-block-header n)
      (yaml-parser-parse!/l-literal-content (add n (m )) (t ))))



; [171]
; l-nb-literal-text(n) ::=
;   l-empty(n,block-in)*
;   s-indent(n) nb-char+

(define (yaml-parser-parse!/l-nb-literal-text self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-nb-literal-text",n))
  (all     (rep 0 #f (yaml-parser-parse!/l-empty n "block-in"))
      (yaml-parser-parse!/s-indent n)
      (rep 1 #f yaml-parser-parse!/nb-char)))



; [172]
; b-nb-literal-next(n) ::=
;   b-as-line-feed
;   l-nb-literal-text(n)

(define (yaml-parser-parse!/b-nb-literal-next self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-nb-literal-next",n))
  (all     yaml-parser-parse!/b-as-line-feed
      (yaml-parser-parse!/l-nb-literal-text n)))



; [173]
; l-literal-content(n,t) ::=
;   ( l-nb-literal-text(n)
;   b-nb-literal-next(n)*
;   b-chomped-last(t) )?
;   l-chomped-empty(n,t)

(define (yaml-parser-parse!/l-literal-content self n t)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-literal-content",nt))
  (all     (rep   0
        1
        (all     (yaml-parser-parse!/l-nb-literal-text n)
            (rep 0 #f (yaml-parser-parse!/b-nb-literal-next n))
            (yaml-parser-parse!/b-chomped-last t)))
      (yaml-parser-parse!/l-chomped-empty n t)))



; [174]
; c-l+folded(n) ::=
;   '>' c-b-block-header(m,t)
;   l-folded-content(n+m,t)

(define (yaml-parser-parse!/c-l+folded self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l+folded",n))
  (all     (chr #\>)
      (yaml-parser-parse!/c-b-block-header n)
      (yaml-parser-parse!/l-folded-content (add n (m )) (t ))))



; [175]
; s-nb-folded-text(n) ::=
;   s-indent(n) ns-char
;   nb-char*

(define (yaml-parser-parse!/s-nb-folded-text self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-nb-folded-text",n))
  (all     (yaml-parser-parse!/s-indent n)
      yaml-parser-parse!/ns-char
      (rep 0 #f yaml-parser-parse!/nb-char)))



; [176]
; l-nb-folded-lines(n) ::=
;   s-nb-folded-text(n)
;   ( b-l-folded(n,block-in) s-nb-folded-text(n) )*

(define (yaml-parser-parse!/l-nb-folded-lines self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-nb-folded-lines",n))
  (all     (yaml-parser-parse!/s-nb-folded-text n)
      (rep   0
        #f
        (all     (yaml-parser-parse!/b-l-folded n "block-in")
            (yaml-parser-parse!/s-nb-folded-text n)))))



; [177]
; s-nb-spaced-text(n) ::=
;   s-indent(n) s-white
;   nb-char*

(define (yaml-parser-parse!/s-nb-spaced-text self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-nb-spaced-text",n))
  (all     (yaml-parser-parse!/s-indent n)
      yaml-parser-parse!/s-white
      (rep 0 #f yaml-parser-parse!/nb-char)))



; [178]
; b-l-spaced(n) ::=
;   b-as-line-feed
;   l-empty(n,block-in)*

(define (yaml-parser-parse!/b-l-spaced self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/b-l-spaced",n))
  (all     yaml-parser-parse!/b-as-line-feed
      (rep 0 #f (yaml-parser-parse!/l-empty n "block-in"))))



; [179]
; l-nb-spaced-lines(n) ::=
;   s-nb-spaced-text(n)
;   ( b-l-spaced(n) s-nb-spaced-text(n) )*

(define (yaml-parser-parse!/l-nb-spaced-lines self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-nb-spaced-lines",n))
  (all     (yaml-parser-parse!/s-nb-spaced-text n)
      (rep   0
        #f
        (all     (yaml-parser-parse!/b-l-spaced n)
            (yaml-parser-parse!/s-nb-spaced-text n)))))



; [180]
; l-nb-same-lines(n) ::=
;   l-empty(n,block-in)*
;   ( l-nb-folded-lines(n) | l-nb-spaced-lines(n) )

(define (yaml-parser-parse!/l-nb-same-lines self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-nb-same-lines",n))
  (all     (rep 0 #f (yaml-parser-parse!/l-empty n "block-in"))
      (any     (yaml-parser-parse!/l-nb-folded-lines n)
          (yaml-parser-parse!/l-nb-spaced-lines n))))



; [181]
; l-nb-diff-lines(n) ::=
;   l-nb-same-lines(n)
;   ( b-as-line-feed l-nb-same-lines(n) )*

(define (yaml-parser-parse!/l-nb-diff-lines self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-nb-diff-lines",n))
  (all     (yaml-parser-parse!/l-nb-same-lines n)
      (rep   0
        #f
        (all     yaml-parser-parse!/b-as-line-feed
            (yaml-parser-parse!/l-nb-same-lines n)))))



; [182]
; l-folded-content(n,t) ::=
;   ( l-nb-diff-lines(n)
;   b-chomped-last(t) )?
;   l-chomped-empty(n,t)

(define (yaml-parser-parse!/l-folded-content self n t)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-folded-content",nt))
  (all     (rep   0
        1
        (all     (yaml-parser-parse!/l-nb-diff-lines n)
            (yaml-parser-parse!/b-chomped-last t)))
      (yaml-parser-parse!/l-chomped-empty n t)))



; [183]
; l+block-sequence(n) ::=
;   ( s-indent(n+m)
;   c-l-block-seq-entry(n+m) )+
;   <for_some_fixed_auto-detected_m_>_0>

(define (yaml-parser-parse!/l+block-sequence self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l+block-sequence",n))
  (all     (rep   1
        #f
        (all     (yaml-parser-parse!/s-indent (add n m))
            (yaml-parser-parse!/c-l-block-seq-entry (add n m))))))



; [184]
; c-l-block-seq-entry(n) ::=
;   '-' <not_followed_by_an_ns-char>
;   s-l+block-indented(n,block-in)

(define (yaml-parser-parse!/c-l-block-seq-entry self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l-block-seq-entry",n))
  (all     (chr #\-)
      (chk '!' yaml-parser-parse!/ns-char)
      (yaml-parser-parse!/s-l+block-indented n "block-in")))



; [185]
; s-l+block-indented(n,c) ::=
;   ( s-indent(m)
;   ( ns-l-compact-sequence(n+1+m)
;   | ns-l-compact-mapping(n+1+m) ) )
;   | s-l+block-node(n,c)
;   | ( e-node s-l-comments )

(define (yaml-parser-parse!/s-l+block-indented self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+block-indented",nc))
  (any     (all     (yaml-parser-parse!/s-indent m)
          (any     (yaml-parser-parse!/ns-l-compact-sequence (add n (add 1 m)))
              (yaml-parser-parse!/ns-l-compact-mapping (add n (add 1 m)))))
      (yaml-parser-parse!/s-l+block-node n c)
      (all     yaml-parser-parse!/e-node
          yaml-parser-parse!/s-l-comments)))



; [186]
; ns-l-compact-sequence(n) ::=
;   c-l-block-seq-entry(n)
;   ( s-indent(n) c-l-block-seq-entry(n) )*

(define (yaml-parser-parse!/ns-l-compact-sequence self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-l-compact-sequence",n))
  (all     (yaml-parser-parse!/c-l-block-seq-entry n)
      (rep   0
        #f
        (all     (yaml-parser-parse!/s-indent n)
            (yaml-parser-parse!/c-l-block-seq-entry n)))))



; [187]
; l+block-mapping(n) ::=
;   ( s-indent(n+m)
;   ns-l-block-map-entry(n+m) )+
;   <for_some_fixed_auto-detected_m_>_0>

(define (yaml-parser-parse!/l+block-mapping self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l+block-mapping",n))
  (all     (rep   1
        #f
        (all     (yaml-parser-parse!/s-indent (add n m))
            (yaml-parser-parse!/ns-l-block-map-entry (add n m))))))



; [188]
; ns-l-block-map-entry(n) ::=
;   c-l-block-map-explicit-entry(n)
;   | ns-l-block-map-implicit-entry(n)

(define (yaml-parser-parse!/ns-l-block-map-entry self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-l-block-map-entry",n))
  (any     (yaml-parser-parse!/c-l-block-map-explicit-entry n)
      (yaml-parser-parse!/ns-l-block-map-implicit-entry n)))



; [189]
; c-l-block-map-explicit-entry(n) ::=
;   c-l-block-map-explicit-key(n)
;   ( l-block-map-explicit-value(n)
;   | e-node )

(define (yaml-parser-parse!/c-l-block-map-explicit-entry self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l-block-map-explicit-entry",n))
  (all     (yaml-parser-parse!/c-l-block-map-explicit-key n)
      (any     (yaml-parser-parse!/l-block-map-explicit-value n)
          yaml-parser-parse!/e-node)))



; [190]
; c-l-block-map-explicit-key(n) ::=
;   '?'
;   s-l+block-indented(n,block-out)

(define (yaml-parser-parse!/c-l-block-map-explicit-key self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l-block-map-explicit-key",n))
  (all     (chr #\?)
      (chk   '='
        (any     yaml-parser-parse!/end-of-stream
            yaml-parser-parse!/s-white
            yaml-parser-parse!/b-break))
      (yaml-parser-parse!/s-l+block-indented n "block-out")))



; [191]
; l-block-map-explicit-value(n) ::=
;   s-indent(n)
;   ':' s-l+block-indented(n,block-out)

(define (yaml-parser-parse!/l-block-map-explicit-value self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-block-map-explicit-value",n))
  (all     (yaml-parser-parse!/s-indent n)
      (chr #\:)
      (yaml-parser-parse!/s-l+block-indented n "block-out")))



; [192]
; ns-l-block-map-implicit-entry(n) ::=
;   (
;   ns-s-block-map-implicit-key
;   | e-node )
;   c-l-block-map-implicit-value(n)

(define (yaml-parser-parse!/ns-l-block-map-implicit-entry self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-l-block-map-implicit-entry",n))
  (all     (any     yaml-parser-parse!/ns-s-block-map-implicit-key
          yaml-parser-parse!/e-node)
      (yaml-parser-parse!/c-l-block-map-implicit-value n)))



; [193]
; ns-s-block-map-implicit-key ::=
;   c-s-implicit-json-key(block-key)
;   | ns-s-implicit-yaml-key(block-key)

(define (yaml-parser-parse!/ns-s-block-map-implicit-key self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-s-block-map-implicit-key"))
  (any     (yaml-parser-parse!/c-s-implicit-json-key "block-key")
      (yaml-parser-parse!/ns-s-implicit-yaml-key "block-key")))



; [194]
; c-l-block-map-implicit-value(n) ::=
;   ':' (
;   s-l+block-node(n,block-out)
;   | ( e-node s-l-comments ) )

(define (yaml-parser-parse!/c-l-block-map-implicit-value self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-l-block-map-implicit-value",n))
  (all     (chr #\:)
      (any     (yaml-parser-parse!/s-l+block-node n "block-out")
          (all     yaml-parser-parse!/e-node
              yaml-parser-parse!/s-l-comments))))



; [195]
; ns-l-compact-mapping(n) ::=
;   ns-l-block-map-entry(n)
;   ( s-indent(n) ns-l-block-map-entry(n) )*

(define (yaml-parser-parse!/ns-l-compact-mapping self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/ns-l-compact-mapping",n))
  (all     (yaml-parser-parse!/ns-l-block-map-entry n)
      (rep   0
        #f
        (all     (yaml-parser-parse!/s-indent n)
            (yaml-parser-parse!/ns-l-block-map-entry n)))))



; [196]
; s-l+block-node(n,c) ::=
;   s-l+block-in-block(n,c) | s-l+flow-in-block(n)

(define (yaml-parser-parse!/s-l+block-node self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+block-node",nc))
  (any     (yaml-parser-parse!/s-l+block-in-block n c)
      (yaml-parser-parse!/s-l+flow-in-block n)))



; [197]
; s-l+flow-in-block(n) ::=
;   s-separate(n+1,flow-out)
;   ns-flow-node(n+1,flow-out) s-l-comments

(define (yaml-parser-parse!/s-l+flow-in-block self n)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+flow-in-block",n))
  (all     (yaml-parser-parse!/s-separate (add n 1) "flow-out")
      (yaml-parser-parse!/ns-flow-node (add n 1) "flow-out")
      yaml-parser-parse!/s-l-comments))



; [198]
; s-l+block-in-block(n,c) ::=
;   s-l+block-scalar(n,c) | s-l+block-collection(n,c)

(define (yaml-parser-parse!/s-l+block-in-block self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+block-in-block",nc))
  (any     (yaml-parser-parse!/s-l+block-scalar n c)
      (yaml-parser-parse!/s-l+block-collection n c)))



; [199]
; s-l+block-scalar(n,c) ::=
;   s-separate(n+1,c)
;   ( c-ns-properties(n+1,c) s-separate(n+1,c) )?
;   ( c-l+literal(n) | c-l+folded(n) )

(define (yaml-parser-parse!/s-l+block-scalar self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+block-scalar",nc))
  (all     (yaml-parser-parse!/s-separate (add n 1) c)
      (rep   0
        1
        (all     (yaml-parser-parse!/c-ns-properties (add n 1) c)
            (yaml-parser-parse!/s-separate (add n 1) c)))
      (any     (yaml-parser-parse!/c-l+literal n)
          (yaml-parser-parse!/c-l+folded n))))



; [200]
; s-l+block-collection(n,c) ::=
;   ( s-separate(n+1,c)
;   c-ns-properties(n+1,c) )?
;   s-l-comments
;   ( l+block-sequence(seq-spaces(n,c))
;   | l+block-mapping(n) )

(define (yaml-parser-parse!/s-l+block-collection self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/s-l+block-collection",nc))
  (all     (rep   0
        1
        (all     (yaml-parser-parse!/s-separate (add n 1) c)
            (any     (all     (yaml-parser-parse!/c-ns-properties (add n 1) c)
                    yaml-parser-parse!/s-l-comments)
                (all     yaml-parser-parse!/c-ns-tag-property
                    yaml-parser-parse!/s-l-comments)
                (all     yaml-parser-parse!/c-ns-anchor-property
                    yaml-parser-parse!/s-l-comments))))
      yaml-parser-parse!/s-l-comments
      (any     (yaml-parser-parse!/l+block-sequence (yaml-parser-parse!/seq-spaces n c))
          (yaml-parser-parse!/l+block-mapping n))))



; [201]
; seq-spaces(n,c) ::=
;   ( c = block-out => n-1 )
;   ( c = block-in => n )

(define (yaml-parser-parse!/seq-spaces self n c)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/seq-spaces",nc))
  (flip   c
    {
      'block-in' => n,
      'block-out' => (sub n 1),
    }))



; [202]
; l-document-prefix ::=
;   c-byte-order-mark? l-comment*

(define (yaml-parser-parse!/l-document-prefix self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-document-prefix"))
  (all     (rep 0 1 yaml-parser-parse!/c-byte-order-mark)
      (rep 0 #f yaml-parser-parse!/l-comment)))



; [203]
; c-directives-end ::=
;   '-' '-' '-'

(define (yaml-parser-parse!/c-directives-end self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-directives-end"))
  (all     (chr #\-)
      (chr #\-)
      (chr #\-)
      (chk   '='
        (any     yaml-parser-parse!/end-of-stream
            yaml-parser-parse!/s-white
            yaml-parser-parse!/b-break))))



; [204]
; c-document-end ::=
;   '.' '.' '.'

(define (yaml-parser-parse!/c-document-end self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-document-end"))
  (all     (chr #\.)
      (chr #\.)
      (chr #\.)))



; [205]
; l-document-suffix ::=
;   c-document-end s-l-comments

(define (yaml-parser-parse!/l-document-suffix self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-document-suffix"))
  (all     yaml-parser-parse!/c-document-end
      yaml-parser-parse!/s-l-comments))



; [206]
; c-forbidden ::=
;   <start_of_line>
;   ( c-directives-end | c-document-end )
;   ( b-char | s-white | <end_of_file> )

(define (yaml-parser-parse!/c-forbidden self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/c-forbidden"))
  (all     yaml-parser-parse!/start-of-line
      (any     yaml-parser-parse!/c-directives-end
          yaml-parser-parse!/c-document-end)
      (any     yaml-parser-parse!/b-char
          yaml-parser-parse!/s-white
          yaml-parser-parse!/end-of-stream)))



; [207]
; l-bare-document ::=
;   s-l+block-node(-1,block-in)
;   <excluding_c-forbidden_content>

(define (yaml-parser-parse!/l-bare-document self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-bare-document"))
  (all     (exclude yaml-parser-parse!/c-forbidden)
      (yaml-parser-parse!/s-l+block-node -1 "block-in")))



; [208]
; l-explicit-document ::=
;   c-directives-end
;   ( l-bare-document
;   | ( e-node s-l-comments ) )

(define (yaml-parser-parse!/l-explicit-document self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-explicit-document"))
  (all     yaml-parser-parse!/c-directives-end
      (any     yaml-parser-parse!/l-bare-document
          (all     yaml-parser-parse!/e-node
              yaml-parser-parse!/s-l-comments))))



; [209]
; l-directive-document ::=
;   l-directive+
;   l-explicit-document

(define (yaml-parser-parse!/l-directive-document self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-directive-document"))
  (all     (rep 1 #f yaml-parser-parse!/l-directive)
      yaml-parser-parse!/l-explicit-document))



; [210]
; l-any-document ::=
;   l-directive-document
;   | l-explicit-document
;   | l-bare-document

(define (yaml-parser-parse!/l-any-document self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-any-document"))
  (any     yaml-parser-parse!/l-directive-document
      yaml-parser-parse!/l-explicit-document
      yaml-parser-parse!/l-bare-document))



; [211]
; l-yaml-stream ::=
;   l-document-prefix* l-any-document?
;   ( ( l-document-suffix+ l-document-prefix*
;   l-any-document? )
;   | ( l-document-prefix* l-explicit-document? ) )*

(define (yaml-parser-parse!/l-yaml-stream self)
  (unless (yaml-parser? self)
    (error "not a yaml parser: " self))
  (when +debug+
    (debug-rule "yaml-parser-parse!/l-yaml-stream"))
  (all     yaml-parser-parse!/l-document-prefix
      (rep 0 1 yaml-parser-parse!/l-any-document)
      (rep   0
        #f
        (any     (all     yaml-parser-parse!/l-document-suffix
                (rep 0 #f yaml-parser-parse!/l-document-prefix)
                (rep 0 1 yaml-parser-parse!/l-any-document))
            (all     yaml-parser-parse!/l-document-prefix
                (rep 0 1 yaml-parser-parse!/l-explicit-document))))))



    