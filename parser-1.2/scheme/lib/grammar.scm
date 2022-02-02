;;;
;;; This grammar class was generated from https://yaml.org/spec/1.2/spec.html
;;;

(load "prelude.scm")
(define +debug+ (get-environment-variable "DEBUG"))
;;; 000: TOP


; [001]
; c-printable ::=
;   x:9 | x:A | x:D | [x:20-x:7E]
;   | x:85 | [x:A0-x:D7FF] | [x:E000-x:FFFD]
;   | [x:10000-x:10FFFF]

(define (c_printable self)
  (when +debug+ (debug-rule "c_printable"))
  ((self 'any)   ((self 'chr) "\x{09}")
    ((self 'chr) "\x{0A}")
    ((self 'chr) "\x{0D}")
    ((self 'rng) "\x{20}" "\x{7E}")
    ((self 'chr) "\x{85}")
    ((self 'rng) "\x{A0}" "\x{D7FF}")
    ((self 'rng) "\x{E000}" "\x{FFFD}")
    ((self 'rng) "\x{010000}" "\x{10FFFF}")))



; [002]
; nb-json ::=
;   x:9 | [x:20-x:10FFFF]

(define (nb_json self)
  (when +debug+ (debug-rule "nb_json"))
  ((self 'any)   ((self 'chr) "\x{09}")
    ((self 'rng) "\x{20}" "\x{10FFFF}")))



; [003]
; c-byte-order-mark ::=
;   x:FEFF

(define (c_byte_order_mark self)
  (when +debug+ (debug-rule "c_byte_order_mark"))
  ((self 'chr) "\x{FEFF}"))



; [004]
; c-sequence-entry ::=
;   '-'

(define (c_sequence_entry self)
  (when +debug+ (debug-rule "c_sequence_entry"))
  ((self 'chr) '-'))



; [005]
; c-mapping-key ::=
;   '?'

(define (c_mapping_key self)
  (when +debug+ (debug-rule "c_mapping_key"))
  ((self 'chr) '?'))



; [006]
; c-mapping-value ::=
;   ':'

(define (c_mapping_value self)
  (when +debug+ (debug-rule "c_mapping_value"))
  ((self 'chr) ':'))



; [007]
; c-collect-entry ::=
;   ','

(define (c_collect_entry self)
  (when +debug+ (debug-rule "c_collect_entry"))
  ((self 'chr) ','))



; [008]
; c-sequence-start ::=
;   '['

(define (c_sequence_start self)
  (when +debug+ (debug-rule "c_sequence_start"))
  ((self 'chr) '['))



; [009]
; c-sequence-end ::=
;   ']'

(define (c_sequence_end self)
  (when +debug+ (debug-rule "c_sequence_end"))
  ((self 'chr) ']'))



; [010]
; c-mapping-start ::=
;   '{'

(define (c_mapping_start self)
  (when +debug+ (debug-rule "c_mapping_start"))
  ((self 'chr) '{'))



; [011]
; c-mapping-end ::=
;   '}'

(define (c_mapping_end self)
  (when +debug+ (debug-rule "c_mapping_end"))
  ((self 'chr) '}'))



; [012]
; c-comment ::=
;   '#'

(define (c_comment self)
  (when +debug+ (debug-rule "c_comment"))
  ((self 'chr) '#'))



; [013]
; c-anchor ::=
;   '&'

(define (c_anchor self)
  (when +debug+ (debug-rule "c_anchor"))
  ((self 'chr) '&'))



; [014]
; c-alias ::=
;   '*'

(define (c_alias self)
  (when +debug+ (debug-rule "c_alias"))
  ((self 'chr) '*'))



; [015]
; c-tag ::=
;   '!'

(define (c_tag self)
  (when +debug+ (debug-rule "c_tag"))
  ((self 'chr) '!'))



; [016]
; c-literal ::=
;   '|'

(define (c_literal self)
  (when +debug+ (debug-rule "c_literal"))
  ((self 'chr) '|'))



; [017]
; c-folded ::=
;   '>'

(define (c_folded self)
  (when +debug+ (debug-rule "c_folded"))
  ((self 'chr) '>'))



; [018]
; c-single-quote ::=
;   '''

(define (c_single_quote self)
  (when +debug+ (debug-rule "c_single_quote"))
  ((self 'chr) "'"))



; [019]
; c-double-quote ::=
;   '"'

(define (c_double_quote self)
  (when +debug+ (debug-rule "c_double_quote"))
  ((self 'chr) '"'))



; [020]
; c-directive ::=
;   '%'

(define (c_directive self)
  (when +debug+ (debug-rule "c_directive"))
  ((self 'chr) '%'))



; [021]
; c-reserved ::=
;   '@' | '`'

(define (c_reserved self)
  (when +debug+ (debug-rule "c_reserved"))
  ((self 'any)   ((self 'chr) '@')
    ((self 'chr) '`')))



; [022]
; c-indicator ::=
;   '-' | '?' | ':' | ',' | '[' | ']' | '{' | '}'
;   | '#' | '&' | '*' | '!' | '|' | '>' | ''' | '"'
;   | '%' | '@' | '`'

(define (c_indicator self)
  (when +debug+ (debug-rule "c_indicator"))
  ((self 'any)   ((self 'chr) '-')
    ((self 'chr) '?')
    ((self 'chr) ':')
    ((self 'chr) ',')
    ((self 'chr) '[')
    ((self 'chr) ']')
    ((self 'chr) '{')
    ((self 'chr) '}')
    ((self 'chr) '#')
    ((self 'chr) '&')
    ((self 'chr) '*')
    ((self 'chr) '!')
    ((self 'chr) '|')
    ((self 'chr) '>')
    ((self 'chr) "'")
    ((self 'chr) '"')
    ((self 'chr) '%')
    ((self 'chr) '@')
    ((self 'chr) '`')))



; [023]
; c-flow-indicator ::=
;   ',' | '[' | ']' | '{' | '}'

(define (c_flow_indicator self)
  (when +debug+ (debug-rule "c_flow_indicator"))
  ((self 'any)   ((self 'chr) ',')
    ((self 'chr) '[')
    ((self 'chr) ']')
    ((self 'chr) '{')
    ((self 'chr) '}')))



; [024]
; b-line-feed ::=
;   x:A

(define (b_line_feed self)
  (when +debug+ (debug-rule "b_line_feed"))
  ((self 'chr) "\x{0A}"))



; [025]
; b-carriage-return ::=
;   x:D

(define (b_carriage_return self)
  (when +debug+ (debug-rule "b_carriage_return"))
  ((self 'chr) "\x{0D}"))



; [026]
; b-char ::=
;   b-line-feed | b-carriage-return

(define (b_char self)
  (when +debug+ (debug-rule "b_char"))
  ((self 'any)   b_line_feed
    b_carriage_return))



; [027]
; nb-char ::=
;   c-printable - b-char - c-byte-order-mark

(define (nb_char self)
  (when +debug+ (debug-rule "nb_char"))
  ((self 'but)   c_printable
    b_char
    c_byte_order_mark))



; [028]
; b-break ::=
;   ( b-carriage-return b-line-feed )
;   | b-carriage-return
;   | b-line-feed

(define (b_break self)
  (when +debug+ (debug-rule "b_break"))
  ((self 'any)   ((self 'all)   b_carriage_return
      b_line_feed)
    b_carriage_return
    b_line_feed))



; [029]
; b-as-line-feed ::=
;   b-break

(define (b_as_line_feed self)
  (when +debug+ (debug-rule "b_as_line_feed"))
  b_break)



; [030]
; b-non-content ::=
;   b-break

(define (b_non_content self)
  (when +debug+ (debug-rule "b_non_content"))
  b_break)



; [031]
; s-space ::=
;   x:20

(define (s_space self)
  (when +debug+ (debug-rule "s_space"))
  ((self 'chr) "\x{20}"))



; [032]
; s-tab ::=
;   x:9

(define (s_tab self)
  (when +debug+ (debug-rule "s_tab"))
  ((self 'chr) "\x{09}"))



; [033]
; s-white ::=
;   s-space | s-tab

(define (s_white self)
  (when +debug+ (debug-rule "s_white"))
  ((self 'any)   s_space
    s_tab))



; [034]
; ns-char ::=
;   nb-char - s-white

(define (ns_char self)
  (when +debug+ (debug-rule "ns_char"))
  ((self 'but)   nb_char
    s_white))



; [035]
; ns-dec-digit ::=
;   [x:30-x:39]

(define (ns_dec_digit self)
  (when +debug+ (debug-rule "ns_dec_digit"))
  ((self 'rng) "\x{30}" "\x{39}"))



; [036]
; ns-hex-digit ::=
;   ns-dec-digit
;   | [x:41-x:46] | [x:61-x:66]

(define (ns_hex_digit self)
  (when +debug+ (debug-rule "ns_hex_digit"))
  ((self 'any)   ns_dec_digit
    ((self 'rng) "\x{41}" "\x{46}")
    ((self 'rng) "\x{61}" "\x{66}")))



; [037]
; ns-ascii-letter ::=
;   [x:41-x:5A] | [x:61-x:7A]

(define (ns_ascii_letter self)
  (when +debug+ (debug-rule "ns_ascii_letter"))
  ((self 'any)   ((self 'rng) "\x{41}" "\x{5A}")
    ((self 'rng) "\x{61}" "\x{7A}")))



; [038]
; ns-word-char ::=
;   ns-dec-digit | ns-ascii-letter | '-'

(define (ns_word_char self)
  (when +debug+ (debug-rule "ns_word_char"))
  ((self 'any)   ns_dec_digit
    ns_ascii_letter
    ((self 'chr) '-')))



; [039]
; ns-uri-char ::=
;   '%' ns-hex-digit ns-hex-digit | ns-word-char | '#'
;   | ';' | '/' | '?' | ':' | '@' | '&' | '=' | '+' | '$' | ','
;   | '_' | '.' | '!' | '~' | '*' | ''' | '(' | ')' | '[' | ']'

(define (ns_uri_char self)
  (when +debug+ (debug-rule "ns_uri_char"))
  ((self 'any)   ((self 'all)   ((self 'chr) '%')
      ns_hex_digit
      ns_hex_digit)
    ns_word_char
    ((self 'chr) '#')
    ((self 'chr) ';')
    ((self 'chr) '/')
    ((self 'chr) '?')
    ((self 'chr) ':')
    ((self 'chr) '@')
    ((self 'chr) '&')
    ((self 'chr) '=')
    ((self 'chr) '+')
    ((self 'chr) '$')
    ((self 'chr) ',')
    ((self 'chr) '_')
    ((self 'chr) '.')
    ((self 'chr) '!')
    ((self 'chr) '~')
    ((self 'chr) '*')
    ((self 'chr) "'")
    ((self 'chr) '(')
    ((self 'chr) ')')
    ((self 'chr) '[')
    ((self 'chr) ']')))



; [040]
; ns-tag-char ::=
;   ns-uri-char - '!' - c-flow-indicator

(define (ns_tag_char self)
  (when +debug+ (debug-rule "ns_tag_char"))
  ((self 'but)   ns_uri_char
    ((self 'chr) '!')
    c_flow_indicator))



; [041]
; c-escape ::=
;   '\'

(define (c_escape self)
  (when +debug+ (debug-rule "c_escape"))
  ((self 'chr) "\\"))



; [042]
; ns-esc-null ::=
;   '0'

(define (ns_esc_null self)
  (when +debug+ (debug-rule "ns_esc_null"))
  ((self 'chr) '0'))



; [043]
; ns-esc-bell ::=
;   'a'

(define (ns_esc_bell self)
  (when +debug+ (debug-rule "ns_esc_bell"))
  ((self 'chr) 'a'))



; [044]
; ns-esc-backspace ::=
;   'b'

(define (ns_esc_backspace self)
  (when +debug+ (debug-rule "ns_esc_backspace"))
  ((self 'chr) 'b'))



; [045]
; ns-esc-horizontal-tab ::=
;   't' | x:9

(define (ns_esc_horizontal_tab self)
  (when +debug+ (debug-rule "ns_esc_horizontal_tab"))
  ((self 'any)   ((self 'chr) 't')
    ((self 'chr) "\x{09}")))



; [046]
; ns-esc-line-feed ::=
;   'n'

(define (ns_esc_line_feed self)
  (when +debug+ (debug-rule "ns_esc_line_feed"))
  ((self 'chr) 'n'))



; [047]
; ns-esc-vertical-tab ::=
;   'v'

(define (ns_esc_vertical_tab self)
  (when +debug+ (debug-rule "ns_esc_vertical_tab"))
  ((self 'chr) 'v'))



; [048]
; ns-esc-form-feed ::=
;   'f'

(define (ns_esc_form_feed self)
  (when +debug+ (debug-rule "ns_esc_form_feed"))
  ((self 'chr) 'f'))



; [049]
; ns-esc-carriage-return ::=
;   'r'

(define (ns_esc_carriage_return self)
  (when +debug+ (debug-rule "ns_esc_carriage_return"))
  ((self 'chr) 'r'))



; [050]
; ns-esc-escape ::=
;   'e'

(define (ns_esc_escape self)
  (when +debug+ (debug-rule "ns_esc_escape"))
  ((self 'chr) 'e'))



; [051]
; ns-esc-space ::=
;   x:20

(define (ns_esc_space self)
  (when +debug+ (debug-rule "ns_esc_space"))
  ((self 'chr) "\x{20}"))



; [052]
; ns-esc-double-quote ::=
;   '"'

(define (ns_esc_double_quote self)
  (when +debug+ (debug-rule "ns_esc_double_quote"))
  ((self 'chr) '"'))



; [053]
; ns-esc-slash ::=
;   '/'

(define (ns_esc_slash self)
  (when +debug+ (debug-rule "ns_esc_slash"))
  ((self 'chr) '/'))



; [054]
; ns-esc-backslash ::=
;   '\'

(define (ns_esc_backslash self)
  (when +debug+ (debug-rule "ns_esc_backslash"))
  ((self 'chr) "\\"))



; [055]
; ns-esc-next-line ::=
;   'N'

(define (ns_esc_next_line self)
  (when +debug+ (debug-rule "ns_esc_next_line"))
  ((self 'chr) 'N'))



; [056]
; ns-esc-non-breaking-space ::=
;   '_'

(define (ns_esc_non_breaking_space self)
  (when +debug+ (debug-rule "ns_esc_non_breaking_space"))
  ((self 'chr) '_'))



; [057]
; ns-esc-line-separator ::=
;   'L'

(define (ns_esc_line_separator self)
  (when +debug+ (debug-rule "ns_esc_line_separator"))
  ((self 'chr) 'L'))



; [058]
; ns-esc-paragraph-separator ::=
;   'P'

(define (ns_esc_paragraph_separator self)
  (when +debug+ (debug-rule "ns_esc_paragraph_separator"))
  ((self 'chr) 'P'))



; [059]
; ns-esc-8-bit ::=
;   'x'
;   ( ns-hex-digit{2} )

(define (ns_esc_8_bit self)
  (when +debug+ (debug-rule "ns_esc_8_bit"))
  ((self 'all)   ((self 'chr) 'x')
    ((self 'rep) 2 2 ns_hex_digit)))



; [060]
; ns-esc-16-bit ::=
;   'u'
;   ( ns-hex-digit{4} )

(define (ns_esc_16_bit self)
  (when +debug+ (debug-rule "ns_esc_16_bit"))
  ((self 'all)   ((self 'chr) 'u')
    ((self 'rep) 4 4 ns_hex_digit)))



; [061]
; ns-esc-32-bit ::=
;   'U'
;   ( ns-hex-digit{8} )

(define (ns_esc_32_bit self)
  (when +debug+ (debug-rule "ns_esc_32_bit"))
  ((self 'all)   ((self 'chr) 'U')
    ((self 'rep) 8 8 ns_hex_digit)))



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

(define (c_ns_esc_char self)
  (when +debug+ (debug-rule "c_ns_esc_char"))
  ((self 'all)   ((self 'chr) "\\")
    ((self 'any)   ns_esc_null
      ns_esc_bell
      ns_esc_backspace
      ns_esc_horizontal_tab
      ns_esc_line_feed
      ns_esc_vertical_tab
      ns_esc_form_feed
      ns_esc_carriage_return
      ns_esc_escape
      ns_esc_space
      ns_esc_double_quote
      ns_esc_slash
      ns_esc_backslash
      ns_esc_next_line
      ns_esc_non_breaking_space
      ns_esc_line_separator
      ns_esc_paragraph_separator
      ns_esc_8_bit
      ns_esc_16_bit
      ns_esc_32_bit)))



; [063]
; s-indent(n) ::=
;   s-space{n}

(define (s_indent self n)
  (when +debug+ (debug-rule "s_indent",n))
  ((self 'rep) n n s_space))



; [064]
; s-indent(<n) ::=
;   s-space{m} <where_m_<_n>

(define (s_indent_lt self n)
  (when +debug+ (debug-rule "s_indent_lt",n))
  ((self 'may)   ((self 'all)   ((self 'rep) 0 #f s_space)
      ((self 'lt) ((self 'len) match) n))))



; [065]
; s-indent(<=n) ::=
;   s-space{m} <where_m_<=_n>

(define (s_indent_le self n)
  (when +debug+ (debug-rule "s_indent_le",n))
  ((self 'may)   ((self 'all)   ((self 'rep) 0 #f s_space)
      ((self 'le) ((self 'len) match) n))))



; [066]
; s-separate-in-line ::=
;   s-white+ | <start_of_line>

(define (s_separate_in_line self)
  (when +debug+ (debug-rule "s_separate_in_line"))
  ((self 'any)   ((self 'rep) 1 #f s_white)
    start_of_line))



; [067]
; s-line-prefix(n,c) ::=
;   ( c = block-out => s-block-line-prefix(n) )
;   ( c = block-in => s-block-line-prefix(n) )
;   ( c = flow-out => s-flow-line-prefix(n) )
;   ( c = flow-in => s-flow-line-prefix(n) )

(define (s_line_prefix self n c)
  (when +debug+ (debug-rule "s_line_prefix",nc))
  ((self 'case)   c
    {
      'block-in' => [ s_block_line_prefix, n ],
      'block-out' => [ s_block_line_prefix, n ],
      'flow-in' => [ s_flow_line_prefix, n ],
      'flow-out' => [ s_flow_line_prefix, n ],
    }))



; [068]
; s-block-line-prefix(n) ::=
;   s-indent(n)

(define (s_block_line_prefix self n)
  (when +debug+ (debug-rule "s_block_line_prefix",n))
  [ s_indent, n ])



; [069]
; s-flow-line-prefix(n) ::=
;   s-indent(n)
;   s-separate-in-line?

(define (s_flow_line_prefix self n)
  (when +debug+ (debug-rule "s_flow_line_prefix",n))
  ((self 'all)   [ s_indent, n ]
    ((self 'rep) 0 1 s_separate_in_line)))



; [070]
; l-empty(n,c) ::=
;   ( s-line-prefix(n,c) | s-indent(<n) )
;   b-as-line-feed

(define (l_empty self n c)
  (when +debug+ (debug-rule "l_empty",nc))
  ((self 'all)   ((self 'any)   [ s_line_prefix, n, c ]
      [ s_indent_lt, n ])
    b_as_line_feed))



; [071]
; b-l-trimmed(n,c) ::=
;   b-non-content l-empty(n,c)+

(define (b_l_trimmed self n c)
  (when +debug+ (debug-rule "b_l_trimmed",nc))
  ((self 'all)   b_non_content
    ((self 'rep) 1 #f [ l_empty, n, c ])))



; [072]
; b-as-space ::=
;   b-break

(define (b_as_space self)
  (when +debug+ (debug-rule "b_as_space"))
  b_break)



; [073]
; b-l-folded(n,c) ::=
;   b-l-trimmed(n,c) | b-as-space

(define (b_l_folded self n c)
  (when +debug+ (debug-rule "b_l_folded",nc))
  ((self 'any)   [ b_l_trimmed, n, c ]
    b_as_space))



; [074]
; s-flow-folded(n) ::=
;   s-separate-in-line?
;   b-l-folded(n,flow-in)
;   s-flow-line-prefix(n)

(define (s_flow_folded self n)
  (when +debug+ (debug-rule "s_flow_folded",n))
  ((self 'all)   ((self 'rep) 0 1 s_separate_in_line)
    [ b_l_folded, n, "flow-in" ]
    [ s_flow_line_prefix, n ]))



; [075]
; c-nb-comment-text ::=
;   '#' nb-char*

(define (c_nb_comment_text self)
  (when +debug+ (debug-rule "c_nb_comment_text"))
  ((self 'all)   ((self 'chr) '#')
    ((self 'rep) 0 #f nb_char)))



; [076]
; b-comment ::=
;   b-non-content | <end_of_file>

(define (b_comment self)
  (when +debug+ (debug-rule "b_comment"))
  ((self 'any)   b_non_content
    end_of_stream))



; [077]
; s-b-comment ::=
;   ( s-separate-in-line
;   c-nb-comment-text? )?
;   b-comment

(define (s_b_comment self)
  (when +debug+ (debug-rule "s_b_comment"))
  ((self 'all)   ((self 'rep)   0
      1
      ((self 'all)   s_separate_in_line
        ((self 'rep) 0 1 c_nb_comment_text)))
    b_comment))



; [078]
; l-comment ::=
;   s-separate-in-line c-nb-comment-text?
;   b-comment

(define (l_comment self)
  (when +debug+ (debug-rule "l_comment"))
  ((self 'all)   s_separate_in_line
    ((self 'rep) 0 1 c_nb_comment_text)
    b_comment))



; [079]
; s-l-comments ::=
;   ( s-b-comment | <start_of_line> )
;   l-comment*

(define (s_l_comments self)
  (when +debug+ (debug-rule "s_l_comments"))
  ((self 'all)   ((self 'any)   s_b_comment
      start_of_line)
    ((self 'rep) 0 #f l_comment)))



; [080]
; s-separate(n,c) ::=
;   ( c = block-out => s-separate-lines(n) )
;   ( c = block-in => s-separate-lines(n) )
;   ( c = flow-out => s-separate-lines(n) )
;   ( c = flow-in => s-separate-lines(n) )
;   ( c = block-key => s-separate-in-line )
;   ( c = flow-key => s-separate-in-line )

(define (s_separate self n c)
  (when +debug+ (debug-rule "s_separate",nc))
  ((self 'case)   c
    {
      'block-in' => [ s_separate_lines, n ],
      'block-key' => s_separate_in_line,
      'block-out' => [ s_separate_lines, n ],
      'flow-in' => [ s_separate_lines, n ],
      'flow-key' => s_separate_in_line,
      'flow-out' => [ s_separate_lines, n ],
    }))



; [081]
; s-separate-lines(n) ::=
;   ( s-l-comments
;   s-flow-line-prefix(n) )
;   | s-separate-in-line

(define (s_separate_lines self n)
  (when +debug+ (debug-rule "s_separate_lines",n))
  ((self 'any)   ((self 'all)   s_l_comments
      [ s_flow_line_prefix, n ])
    s_separate_in_line))



; [082]
; l-directive ::=
;   '%'
;   ( ns-yaml-directive
;   | ns-tag-directive
;   | ns-reserved-directive )
;   s-l-comments

(define (l_directive self)
  (when +debug+ (debug-rule "l_directive"))
  ((self 'all)   ((self 'chr) '%')
    ((self 'any)   ns_yaml_directive
      ns_tag_directive
      ns_reserved_directive)
    s_l_comments))



; [083]
; ns-reserved-directive ::=
;   ns-directive-name
;   ( s-separate-in-line ns-directive-parameter )*

(define (ns_reserved_directive self)
  (when +debug+ (debug-rule "ns_reserved_directive"))
  ((self 'all)   ns_directive_name
    ((self 'rep)   0
      #f
      ((self 'all)   s_separate_in_line
        ns_directive_parameter))))



; [084]
; ns-directive-name ::=
;   ns-char+

(define (ns_directive_name self)
  (when +debug+ (debug-rule "ns_directive_name"))
  ((self 'rep) 1 #f ns_char))



; [085]
; ns-directive-parameter ::=
;   ns-char+

(define (ns_directive_parameter self)
  (when +debug+ (debug-rule "ns_directive_parameter"))
  ((self 'rep) 1 #f ns_char))



; [086]
; ns-yaml-directive ::=
;   'Y' 'A' 'M' 'L'
;   s-separate-in-line ns-yaml-version

(define (ns_yaml_directive self)
  (when +debug+ (debug-rule "ns_yaml_directive"))
  ((self 'all)   ((self 'chr) 'Y')
    ((self 'chr) 'A')
    ((self 'chr) 'M')
    ((self 'chr) 'L')
    s_separate_in_line
    ns_yaml_version))



; [087]
; ns-yaml-version ::=
;   ns-dec-digit+ '.' ns-dec-digit+

(define (ns_yaml_version self)
  (when +debug+ (debug-rule "ns_yaml_version"))
  ((self 'all)   ((self 'rep) 1 #f ns_dec_digit)
    ((self 'chr) '.')
    ((self 'rep) 1 #f ns_dec_digit)))



; [088]
; ns-tag-directive ::=
;   'T' 'A' 'G'
;   s-separate-in-line c-tag-handle
;   s-separate-in-line ns-tag-prefix

(define (ns_tag_directive self)
  (when +debug+ (debug-rule "ns_tag_directive"))
  ((self 'all)   ((self 'chr) 'T')
    ((self 'chr) 'A')
    ((self 'chr) 'G')
    s_separate_in_line
    c_tag_handle
    s_separate_in_line
    ns_tag_prefix))



; [089]
; c-tag-handle ::=
;   c-named-tag-handle
;   | c-secondary-tag-handle
;   | c-primary-tag-handle

(define (c_tag_handle self)
  (when +debug+ (debug-rule "c_tag_handle"))
  ((self 'any)   c_named_tag_handle
    c_secondary_tag_handle
    c_primary_tag_handle))



; [090]
; c-primary-tag-handle ::=
;   '!'

(define (c_primary_tag_handle self)
  (when +debug+ (debug-rule "c_primary_tag_handle"))
  ((self 'chr) '!'))



; [091]
; c-secondary-tag-handle ::=
;   '!' '!'

(define (c_secondary_tag_handle self)
  (when +debug+ (debug-rule "c_secondary_tag_handle"))
  ((self 'all)   ((self 'chr) '!')
    ((self 'chr) '!')))



; [092]
; c-named-tag-handle ::=
;   '!' ns-word-char+ '!'

(define (c_named_tag_handle self)
  (when +debug+ (debug-rule "c_named_tag_handle"))
  ((self 'all)   ((self 'chr) '!')
    ((self 'rep) 1 #f ns_word_char)
    ((self 'chr) '!')))



; [093]
; ns-tag-prefix ::=
;   c-ns-local-tag-prefix | ns-global-tag-prefix

(define (ns_tag_prefix self)
  (when +debug+ (debug-rule "ns_tag_prefix"))
  ((self 'any)   c_ns_local_tag_prefix
    ns_global_tag_prefix))



; [094]
; c-ns-local-tag-prefix ::=
;   '!' ns-uri-char*

(define (c_ns_local_tag_prefix self)
  (when +debug+ (debug-rule "c_ns_local_tag_prefix"))
  ((self 'all)   ((self 'chr) '!')
    ((self 'rep) 0 #f ns_uri_char)))



; [095]
; ns-global-tag-prefix ::=
;   ns-tag-char ns-uri-char*

(define (ns_global_tag_prefix self)
  (when +debug+ (debug-rule "ns_global_tag_prefix"))
  ((self 'all)   ns_tag_char
    ((self 'rep) 0 #f ns_uri_char)))



; [096]
; c-ns-properties(n,c) ::=
;   ( c-ns-tag-property
;   ( s-separate(n,c) c-ns-anchor-property )? )
;   | ( c-ns-anchor-property
;   ( s-separate(n,c) c-ns-tag-property )? )

(define (c_ns_properties self n c)
  (when +debug+ (debug-rule "c_ns_properties",nc))
  ((self 'any)   ((self 'all)   c_ns_tag_property
      ((self 'rep)   0
        1
        ((self 'all)   [ s_separate, n, c ]
          c_ns_anchor_property)))
    ((self 'all)   c_ns_anchor_property
      ((self 'rep)   0
        1
        ((self 'all)   [ s_separate, n, c ]
          c_ns_tag_property)))))



; [097]
; c-ns-tag-property ::=
;   c-verbatim-tag
;   | c-ns-shorthand-tag
;   | c-non-specific-tag

(define (c_ns_tag_property self)
  (when +debug+ (debug-rule "c_ns_tag_property"))
  ((self 'any)   c_verbatim_tag
    c_ns_shorthand_tag
    c_non_specific_tag))



; [098]
; c-verbatim-tag ::=
;   '!' '<' ns-uri-char+ '>'

(define (c_verbatim_tag self)
  (when +debug+ (debug-rule "c_verbatim_tag"))
  ((self 'all)   ((self 'chr) '!')
    ((self 'chr) '<')
    ((self 'rep) 1 #f ns_uri_char)
    ((self 'chr) '>')))



; [099]
; c-ns-shorthand-tag ::=
;   c-tag-handle ns-tag-char+

(define (c_ns_shorthand_tag self)
  (when +debug+ (debug-rule "c_ns_shorthand_tag"))
  ((self 'all)   c_tag_handle
    ((self 'rep) 1 #f ns_tag_char)))



; [100]
; c-non-specific-tag ::=
;   '!'

(define (c_non_specific_tag self)
  (when +debug+ (debug-rule "c_non_specific_tag"))
  ((self 'chr) '!'))



; [101]
; c-ns-anchor-property ::=
;   '&' ns-anchor-name

(define (c_ns_anchor_property self)
  (when +debug+ (debug-rule "c_ns_anchor_property"))
  ((self 'all)   ((self 'chr) '&')
    ns_anchor_name))



; [102]
; ns-anchor-char ::=
;   ns-char - c-flow-indicator

(define (ns_anchor_char self)
  (when +debug+ (debug-rule "ns_anchor_char"))
  ((self 'but)   ns_char
    c_flow_indicator))



; [103]
; ns-anchor-name ::=
;   ns-anchor-char+

(define (ns_anchor_name self)
  (when +debug+ (debug-rule "ns_anchor_name"))
  ((self 'rep) 1 #f ns_anchor_char))



; [104]
; c-ns-alias-node ::=
;   '*' ns-anchor-name

(define (c_ns_alias_node self)
  (when +debug+ (debug-rule "c_ns_alias_node"))
  ((self 'all)   ((self 'chr) '*')
    ns_anchor_name))



; [105]
; e-scalar ::=
;   <empty>

(define (e_scalar self)
  (when +debug+ (debug-rule "e_scalar"))
  empty)



; [106]
; e-node ::=
;   e-scalar

(define (e_node self)
  (when +debug+ (debug-rule "e_node"))
  e_scalar)



; [107]
; nb-double-char ::=
;   c-ns-esc-char | ( nb-json - '\' - '"' )

(define (nb_double_char self)
  (when +debug+ (debug-rule "nb_double_char"))
  ((self 'any)   c_ns_esc_char
    ((self 'but)   nb_json
      ((self 'chr) "\\")
      ((self 'chr) '"'))))



; [108]
; ns-double-char ::=
;   nb-double-char - s-white

(define (ns_double_char self)
  (when +debug+ (debug-rule "ns_double_char"))
  ((self 'but)   nb_double_char
    s_white))



; [109]
; c-double-quoted(n,c) ::=
;   '"' nb-double-text(n,c)
;   '"'

(define (c_double_quoted self n c)
  (when +debug+ (debug-rule "c_double_quoted",nc))
  ((self 'all)   ((self 'chr) '"')
    [ nb_double_text, n, c ]
    ((self 'chr) '"')))



; [110]
; nb-double-text(n,c) ::=
;   ( c = flow-out => nb-double-multi-line(n) )
;   ( c = flow-in => nb-double-multi-line(n) )
;   ( c = block-key => nb-double-one-line )
;   ( c = flow-key => nb-double-one-line )

(define (nb_double_text self n c)
  (when +debug+ (debug-rule "nb_double_text",nc))
  ((self 'case)   c
    {
      'block-key' => nb_double_one_line,
      'flow-in' => [ nb_double_multi_line, n ],
      'flow-key' => nb_double_one_line,
      'flow-out' => [ nb_double_multi_line, n ],
    }))



; [111]
; nb-double-one-line ::=
;   nb-double-char*

(define (nb_double_one_line self)
  (when +debug+ (debug-rule "nb_double_one_line"))
  ((self 'rep) 0 #f nb_double_char))



; [112]
; s-double-escaped(n) ::=
;   s-white* '\'
;   b-non-content
;   l-empty(n,flow-in)* s-flow-line-prefix(n)

(define (s_double_escaped self n)
  (when +debug+ (debug-rule "s_double_escaped",n))
  ((self 'all)   ((self 'rep) 0 #f s_white)
    ((self 'chr) "\\")
    b_non_content
    ((self 'rep) 0 #f [ l_empty, n, "flow-in" ])
    [ s_flow_line_prefix, n ]))



; [113]
; s-double-break(n) ::=
;   s-double-escaped(n) | s-flow-folded(n)

(define (s_double_break self n)
  (when +debug+ (debug-rule "s_double_break",n))
  ((self 'any)   [ s_double_escaped, n ]
    [ s_flow_folded, n ]))



; [114]
; nb-ns-double-in-line ::=
;   ( s-white* ns-double-char )*

(define (nb_ns_double_in_line self)
  (when +debug+ (debug-rule "nb_ns_double_in_line"))
  ((self 'rep)   0
    #f
    ((self 'all)   ((self 'rep) 0 #f s_white)
      ns_double_char)))



; [115]
; s-double-next-line(n) ::=
;   s-double-break(n)
;   ( ns-double-char nb-ns-double-in-line
;   ( s-double-next-line(n) | s-white* ) )?

(define (s_double_next_line self n)
  (when +debug+ (debug-rule "s_double_next_line",n))
  ((self 'all)   [ s_double_break, n ]
    ((self 'rep)   0
      1
      ((self 'all)   ns_double_char
        nb_ns_double_in_line
        ((self 'any)   [ s_double_next_line, n ]
          ((self 'rep) 0 #f s_white))))))



; [116]
; nb-double-multi-line(n) ::=
;   nb-ns-double-in-line
;   ( s-double-next-line(n) | s-white* )

(define (nb_double_multi_line self n)
  (when +debug+ (debug-rule "nb_double_multi_line",n))
  ((self 'all)   nb_ns_double_in_line
    ((self 'any)   [ s_double_next_line, n ]
      ((self 'rep) 0 #f s_white))))



; [117]
; c-quoted-quote ::=
;   ''' '''

(define (c_quoted_quote self)
  (when +debug+ (debug-rule "c_quoted_quote"))
  ((self 'all)   ((self 'chr) "'")
    ((self 'chr) "'")))



; [118]
; nb-single-char ::=
;   c-quoted-quote | ( nb-json - ''' )

(define (nb_single_char self)
  (when +debug+ (debug-rule "nb_single_char"))
  ((self 'any)   c_quoted_quote
    ((self 'but)   nb_json
      ((self 'chr) "'"))))



; [119]
; ns-single-char ::=
;   nb-single-char - s-white

(define (ns_single_char self)
  (when +debug+ (debug-rule "ns_single_char"))
  ((self 'but)   nb_single_char
    s_white))



; [120]
; c-single-quoted(n,c) ::=
;   ''' nb-single-text(n,c)
;   '''

(define (c_single_quoted self n c)
  (when +debug+ (debug-rule "c_single_quoted",nc))
  ((self 'all)   ((self 'chr) "'")
    [ nb_single_text, n, c ]
    ((self 'chr) "'")))



; [121]
; nb-single-text(n,c) ::=
;   ( c = flow-out => nb-single-multi-line(n) )
;   ( c = flow-in => nb-single-multi-line(n) )
;   ( c = block-key => nb-single-one-line )
;   ( c = flow-key => nb-single-one-line )

(define (nb_single_text self n c)
  (when +debug+ (debug-rule "nb_single_text",nc))
  ((self 'case)   c
    {
      'block-key' => nb_single_one_line,
      'flow-in' => [ nb_single_multi_line, n ],
      'flow-key' => nb_single_one_line,
      'flow-out' => [ nb_single_multi_line, n ],
    }))



; [122]
; nb-single-one-line ::=
;   nb-single-char*

(define (nb_single_one_line self)
  (when +debug+ (debug-rule "nb_single_one_line"))
  ((self 'rep) 0 #f nb_single_char))



; [123]
; nb-ns-single-in-line ::=
;   ( s-white* ns-single-char )*

(define (nb_ns_single_in_line self)
  (when +debug+ (debug-rule "nb_ns_single_in_line"))
  ((self 'rep)   0
    #f
    ((self 'all)   ((self 'rep) 0 #f s_white)
      ns_single_char)))



; [124]
; s-single-next-line(n) ::=
;   s-flow-folded(n)
;   ( ns-single-char nb-ns-single-in-line
;   ( s-single-next-line(n) | s-white* ) )?

(define (s_single_next_line self n)
  (when +debug+ (debug-rule "s_single_next_line",n))
  ((self 'all)   [ s_flow_folded, n ]
    ((self 'rep)   0
      1
      ((self 'all)   ns_single_char
        nb_ns_single_in_line
        ((self 'any)   [ s_single_next_line, n ]
          ((self 'rep) 0 #f s_white))))))



; [125]
; nb-single-multi-line(n) ::=
;   nb-ns-single-in-line
;   ( s-single-next-line(n) | s-white* )

(define (nb_single_multi_line self n)
  (when +debug+ (debug-rule "nb_single_multi_line",n))
  ((self 'all)   nb_ns_single_in_line
    ((self 'any)   [ s_single_next_line, n ]
      ((self 'rep) 0 #f s_white))))



; [126]
; ns-plain-first(c) ::=
;   ( ns-char - c-indicator )
;   | ( ( '?' | ':' | '-' )
;   <followed_by_an_ns-plain-safe(c)> )

(define (ns_plain_first self c)
  (when +debug+ (debug-rule "ns_plain_first",c))
  ((self 'any)   ((self 'but)   ns_char
      c_indicator)
    ((self 'all)   ((self 'any)   ((self 'chr) '?')
        ((self 'chr) ':')
        ((self 'chr) '-'))
      ((self 'chk) '=' [ ns_plain_safe, c ]))))



; [127]
; ns-plain-safe(c) ::=
;   ( c = flow-out => ns-plain-safe-out )
;   ( c = flow-in => ns-plain-safe-in )
;   ( c = block-key => ns-plain-safe-out )
;   ( c = flow-key => ns-plain-safe-in )

(define (ns_plain_safe self c)
  (when +debug+ (debug-rule "ns_plain_safe",c))
  ((self 'case)   c
    {
      'block-key' => ns_plain_safe_out,
      'flow-in' => ns_plain_safe_in,
      'flow-key' => ns_plain_safe_in,
      'flow-out' => ns_plain_safe_out,
    }))



; [128]
; ns-plain-safe-out ::=
;   ns-char

(define (ns_plain_safe_out self)
  (when +debug+ (debug-rule "ns_plain_safe_out"))
  ns_char)



; [129]
; ns-plain-safe-in ::=
;   ns-char - c-flow-indicator

(define (ns_plain_safe_in self)
  (when +debug+ (debug-rule "ns_plain_safe_in"))
  ((self 'but)   ns_char
    c_flow_indicator))



; [130]
; ns-plain-char(c) ::=
;   ( ns-plain-safe(c) - ':' - '#' )
;   | ( <an_ns-char_preceding> '#' )
;   | ( ':' <followed_by_an_ns-plain-safe(c)> )

(define (ns_plain_char self c)
  (when +debug+ (debug-rule "ns_plain_char",c))
  ((self 'any)   ((self 'but)   [ ns_plain_safe, c ]
      ((self 'chr) ':')
      ((self 'chr) '#'))
    ((self 'all)   ((self 'chk) '<=' ns_char)
      ((self 'chr) '#'))
    ((self 'all)   ((self 'chr) ':')
      ((self 'chk) '=' [ ns_plain_safe, c ]))))



; [131]
; ns-plain(n,c) ::=
;   ( c = flow-out => ns-plain-multi-line(n,c) )
;   ( c = flow-in => ns-plain-multi-line(n,c) )
;   ( c = block-key => ns-plain-one-line(c) )
;   ( c = flow-key => ns-plain-one-line(c) )

(define (ns_plain self n c)
  (when +debug+ (debug-rule "ns_plain",nc))
  ((self 'case)   c
    {
      'block-key' => [ ns_plain_one_line, c ],
      'flow-in' => [ ns_plain_multi_line, n, c ],
      'flow-key' => [ ns_plain_one_line, c ],
      'flow-out' => [ ns_plain_multi_line, n, c ],
    }))



; [132]
; nb-ns-plain-in-line(c) ::=
;   ( s-white*
;   ns-plain-char(c) )*

(define (nb_ns_plain_in_line self c)
  (when +debug+ (debug-rule "nb_ns_plain_in_line",c))
  ((self 'rep)   0
    #f
    ((self 'all)   ((self 'rep) 0 #f s_white)
      [ ns_plain_char, c ])))



; [133]
; ns-plain-one-line(c) ::=
;   ns-plain-first(c)
;   nb-ns-plain-in-line(c)

(define (ns_plain_one_line self c)
  (when +debug+ (debug-rule "ns_plain_one_line",c))
  ((self 'all)   [ ns_plain_first, c ]
    [ nb_ns_plain_in_line, c ]))



; [134]
; s-ns-plain-next-line(n,c) ::=
;   s-flow-folded(n)
;   ns-plain-char(c) nb-ns-plain-in-line(c)

(define (s_ns_plain_next_line self n c)
  (when +debug+ (debug-rule "s_ns_plain_next_line",nc))
  ((self 'all)   [ s_flow_folded, n ]
    [ ns_plain_char, c ]
    [ nb_ns_plain_in_line, c ]))



; [135]
; ns-plain-multi-line(n,c) ::=
;   ns-plain-one-line(c)
;   s-ns-plain-next-line(n,c)*

(define (ns_plain_multi_line self n c)
  (when +debug+ (debug-rule "ns_plain_multi_line",nc))
  ((self 'all)   [ ns_plain_one_line, c ]
    ((self 'rep) 0 #f [ s_ns_plain_next_line, n, c ])))



; [136]
; in-flow(c) ::=
;   ( c = flow-out => flow-in )
;   ( c = flow-in => flow-in )
;   ( c = block-key => flow-key )
;   ( c = flow-key => flow-key )

(define (in_flow self c)
  (when +debug+ (debug-rule "in_flow",c))
  ((self 'flip)   c
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

(define (c_flow_sequence self n c)
  (when +debug+ (debug-rule "c_flow_sequence",nc))
  ((self 'all)   ((self 'chr) '[')
    ((self 'rep) 0 1 [ s_separate, n, c ])
    ((self 'rep) 0 1 [ ns_s_flow_seq_entries, n, [ in_flow, c ] ])
    ((self 'chr) ']')))



; [138]
; ns-s-flow-seq-entries(n,c) ::=
;   ns-flow-seq-entry(n,c)
;   s-separate(n,c)?
;   ( ',' s-separate(n,c)?
;   ns-s-flow-seq-entries(n,c)? )?

(define (ns_s_flow_seq_entries self n c)
  (when +debug+ (debug-rule "ns_s_flow_seq_entries",nc))
  ((self 'all)   [ ns_flow_seq_entry, n, c ]
    ((self 'rep) 0 1 [ s_separate, n, c ])
    ((self 'rep)   0
      1
      ((self 'all)   ((self 'chr) ',')
        ((self 'rep) 0 1 [ s_separate, n, c ])
        ((self 'rep) 0 1 [ ns_s_flow_seq_entries, n, c ])))))



; [139]
; ns-flow-seq-entry(n,c) ::=
;   ns-flow-pair(n,c) | ns-flow-node(n,c)

(define (ns_flow_seq_entry self n c)
  (when +debug+ (debug-rule "ns_flow_seq_entry",nc))
  ((self 'any)   [ ns_flow_pair, n, c ]
    [ ns_flow_node, n, c ]))



; [140]
; c-flow-mapping(n,c) ::=
;   '{' s-separate(n,c)?
;   ns-s-flow-map-entries(n,in-flow(c))? '}'

(define (c_flow_mapping self n c)
  (when +debug+ (debug-rule "c_flow_mapping",nc))
  ((self 'all)   ((self 'chr) '{')
    ((self 'rep) 0 1 [ s_separate, n, c ])
    ((self 'rep) 0 1 [ ns_s_flow_map_entries, n, [ in_flow, c ] ])
    ((self 'chr) '}')))



; [141]
; ns-s-flow-map-entries(n,c) ::=
;   ns-flow-map-entry(n,c)
;   s-separate(n,c)?
;   ( ',' s-separate(n,c)?
;   ns-s-flow-map-entries(n,c)? )?

(define (ns_s_flow_map_entries self n c)
  (when +debug+ (debug-rule "ns_s_flow_map_entries",nc))
  ((self 'all)   [ ns_flow_map_entry, n, c ]
    ((self 'rep) 0 1 [ s_separate, n, c ])
    ((self 'rep)   0
      1
      ((self 'all)   ((self 'chr) ',')
        ((self 'rep) 0 1 [ s_separate, n, c ])
        ((self 'rep) 0 1 [ ns_s_flow_map_entries, n, c ])))))



; [142]
; ns-flow-map-entry(n,c) ::=
;   ( '?' s-separate(n,c)
;   ns-flow-map-explicit-entry(n,c) )
;   | ns-flow-map-implicit-entry(n,c)

(define (ns_flow_map_entry self n c)
  (when +debug+ (debug-rule "ns_flow_map_entry",nc))
  ((self 'any)   ((self 'all)   ((self 'chr) '?')
      ((self 'chk)   '='
        ((self 'any)   end_of_stream
          s_white
          b_break))
      [ s_separate, n, c ]
      [ ns_flow_map_explicit_entry, n, c ])
    [ ns_flow_map_implicit_entry, n, c ]))



; [143]
; ns-flow-map-explicit-entry(n,c) ::=
;   ns-flow-map-implicit-entry(n,c)
;   | ( e-node
;   e-node )

(define (ns_flow_map_explicit_entry self n c)
  (when +debug+ (debug-rule "ns_flow_map_explicit_entry",nc))
  ((self 'any)   [ ns_flow_map_implicit_entry, n, c ]
    ((self 'all)   e_node
      e_node)))



; [144]
; ns-flow-map-implicit-entry(n,c) ::=
;   ns-flow-map-yaml-key-entry(n,c)
;   | c-ns-flow-map-empty-key-entry(n,c)
;   | c-ns-flow-map-json-key-entry(n,c)

(define (ns_flow_map_implicit_entry self n c)
  (when +debug+ (debug-rule "ns_flow_map_implicit_entry",nc))
  ((self 'any)   [ ns_flow_map_yaml_key_entry, n, c ]
    [ c_ns_flow_map_empty_key_entry, n, c ]
    [ c_ns_flow_map_json_key_entry, n, c ]))



; [145]
; ns-flow-map-yaml-key-entry(n,c) ::=
;   ns-flow-yaml-node(n,c)
;   ( ( s-separate(n,c)?
;   c-ns-flow-map-separate-value(n,c) )
;   | e-node )

(define (ns_flow_map_yaml_key_entry self n c)
  (when +debug+ (debug-rule "ns_flow_map_yaml_key_entry",nc))
  ((self 'all)   [ ns_flow_yaml_node, n, c ]
    ((self 'any)   ((self 'all)   ((self 'rep) 0 1 [ s_separate, n, c ])
        [ c_ns_flow_map_separate_value, n, c ])
      e_node)))



; [146]
; c-ns-flow-map-empty-key-entry(n,c) ::=
;   e-node
;   c-ns-flow-map-separate-value(n,c)

(define (c_ns_flow_map_empty_key_entry self n c)
  (when +debug+ (debug-rule "c_ns_flow_map_empty_key_entry",nc))
  ((self 'all)   e_node
    [ c_ns_flow_map_separate_value, n, c ]))



; [147]
; c-ns-flow-map-separate-value(n,c) ::=
;   ':' <not_followed_by_an_ns-plain-safe(c)>
;   ( ( s-separate(n,c) ns-flow-node(n,c) )
;   | e-node )

(define (c_ns_flow_map_separate_value self n c)
  (when +debug+ (debug-rule "c_ns_flow_map_separate_value",nc))
  ((self 'all)   ((self 'chr) ':')
    ((self 'chk) '!' [ ns_plain_safe, c ])
    ((self 'any)   ((self 'all)   [ s_separate, n, c ]
        [ ns_flow_node, n, c ])
      e_node)))



; [148]
; c-ns-flow-map-json-key-entry(n,c) ::=
;   c-flow-json-node(n,c)
;   ( ( s-separate(n,c)?
;   c-ns-flow-map-adjacent-value(n,c) )
;   | e-node )

(define (c_ns_flow_map_json_key_entry self n c)
  (when +debug+ (debug-rule "c_ns_flow_map_json_key_entry",nc))
  ((self 'all)   [ c_flow_json_node, n, c ]
    ((self 'any)   ((self 'all)   ((self 'rep) 0 1 [ s_separate, n, c ])
        [ c_ns_flow_map_adjacent_value, n, c ])
      e_node)))



; [149]
; c-ns-flow-map-adjacent-value(n,c) ::=
;   ':' ( (
;   s-separate(n,c)?
;   ns-flow-node(n,c) )
;   | e-node )

(define (c_ns_flow_map_adjacent_value self n c)
  (when +debug+ (debug-rule "c_ns_flow_map_adjacent_value",nc))
  ((self 'all)   ((self 'chr) ':')
    ((self 'any)   ((self 'all)   ((self 'rep) 0 1 [ s_separate, n, c ])
        [ ns_flow_node, n, c ])
      e_node)))



; [150]
; ns-flow-pair(n,c) ::=
;   ( '?' s-separate(n,c)
;   ns-flow-map-explicit-entry(n,c) )
;   | ns-flow-pair-entry(n,c)

(define (ns_flow_pair self n c)
  (when +debug+ (debug-rule "ns_flow_pair",nc))
  ((self 'any)   ((self 'all)   ((self 'chr) '?')
      ((self 'chk)   '='
        ((self 'any)   end_of_stream
          s_white
          b_break))
      [ s_separate, n, c ]
      [ ns_flow_map_explicit_entry, n, c ])
    [ ns_flow_pair_entry, n, c ]))



; [151]
; ns-flow-pair-entry(n,c) ::=
;   ns-flow-pair-yaml-key-entry(n,c)
;   | c-ns-flow-map-empty-key-entry(n,c)
;   | c-ns-flow-pair-json-key-entry(n,c)

(define (ns_flow_pair_entry self n c)
  (when +debug+ (debug-rule "ns_flow_pair_entry",nc))
  ((self 'any)   [ ns_flow_pair_yaml_key_entry, n, c ]
    [ c_ns_flow_map_empty_key_entry, n, c ]
    [ c_ns_flow_pair_json_key_entry, n, c ]))



; [152]
; ns-flow-pair-yaml-key-entry(n,c) ::=
;   ns-s-implicit-yaml-key(flow-key)
;   c-ns-flow-map-separate-value(n,c)

(define (ns_flow_pair_yaml_key_entry self n c)
  (when +debug+ (debug-rule "ns_flow_pair_yaml_key_entry",nc))
  ((self 'all)   [ ns_s_implicit_yaml_key, "flow-key" ]
    [ c_ns_flow_map_separate_value, n, c ]))



; [153]
; c-ns-flow-pair-json-key-entry(n,c) ::=
;   c-s-implicit-json-key(flow-key)
;   c-ns-flow-map-adjacent-value(n,c)

(define (c_ns_flow_pair_json_key_entry self n c)
  (when +debug+ (debug-rule "c_ns_flow_pair_json_key_entry",nc))
  ((self 'all)   [ c_s_implicit_json_key, "flow-key" ]
    [ c_ns_flow_map_adjacent_value, n, c ]))



; [154]
; ns-s-implicit-yaml-key(c) ::=
;   ns-flow-yaml-node(n/a,c)
;   s-separate-in-line?
;   <at_most_1024_characters_altogether>

(define (ns_s_implicit_yaml_key self c)
  (when +debug+ (debug-rule "ns_s_implicit_yaml_key",c))
  ((self 'all)   ((self 'max) 1024)
    [ ns_flow_yaml_node, #f, c ]
    ((self 'rep) 0 1 s_separate_in_line)))



; [155]
; c-s-implicit-json-key(c) ::=
;   c-flow-json-node(n/a,c)
;   s-separate-in-line?
;   <at_most_1024_characters_altogether>

(define (c_s_implicit_json_key self c)
  (when +debug+ (debug-rule "c_s_implicit_json_key",c))
  ((self 'all)   ((self 'max) 1024)
    [ c_flow_json_node, #f, c ]
    ((self 'rep) 0 1 s_separate_in_line)))



; [156]
; ns-flow-yaml-content(n,c) ::=
;   ns-plain(n,c)

(define (ns_flow_yaml_content self n c)
  (when +debug+ (debug-rule "ns_flow_yaml_content",nc))
  [ ns_plain, n, c ])



; [157]
; c-flow-json-content(n,c) ::=
;   c-flow-sequence(n,c) | c-flow-mapping(n,c)
;   | c-single-quoted(n,c) | c-double-quoted(n,c)

(define (c_flow_json_content self n c)
  (when +debug+ (debug-rule "c_flow_json_content",nc))
  ((self 'any)   [ c_flow_sequence, n, c ]
    [ c_flow_mapping, n, c ]
    [ c_single_quoted, n, c ]
    [ c_double_quoted, n, c ]))



; [158]
; ns-flow-content(n,c) ::=
;   ns-flow-yaml-content(n,c) | c-flow-json-content(n,c)

(define (ns_flow_content self n c)
  (when +debug+ (debug-rule "ns_flow_content",nc))
  ((self 'any)   [ ns_flow_yaml_content, n, c ]
    [ c_flow_json_content, n, c ]))



; [159]
; ns-flow-yaml-node(n,c) ::=
;   c-ns-alias-node
;   | ns-flow-yaml-content(n,c)
;   | ( c-ns-properties(n,c)
;   ( ( s-separate(n,c)
;   ns-flow-yaml-content(n,c) )
;   | e-scalar ) )

(define (ns_flow_yaml_node self n c)
  (when +debug+ (debug-rule "ns_flow_yaml_node",nc))
  ((self 'any)   c_ns_alias_node
    [ ns_flow_yaml_content, n, c ]
    ((self 'all)   [ c_ns_properties, n, c ]
      ((self 'any)   ((self 'all)   [ s_separate, n, c ]
          [ ns_flow_content, n, c ])
        e_scalar))))



; [160]
; c-flow-json-node(n,c) ::=
;   ( c-ns-properties(n,c)
;   s-separate(n,c) )?
;   c-flow-json-content(n,c)

(define (c_flow_json_node self n c)
  (when +debug+ (debug-rule "c_flow_json_node",nc))
  ((self 'all)   ((self 'rep)   0
      1
      ((self 'all)   [ c_ns_properties, n, c ]
        [ s_separate, n, c ]))
    [ c_flow_json_content, n, c ]))



; [161]
; ns-flow-node(n,c) ::=
;   c-ns-alias-node
;   | ns-flow-content(n,c)
;   | ( c-ns-properties(n,c)
;   ( ( s-separate(n,c)
;   ns-flow-content(n,c) )
;   | e-scalar ) )

(define (ns_flow_node self n c)
  (when +debug+ (debug-rule "ns_flow_node",nc))
  ((self 'any)   c_ns_alias_node
    [ ns_flow_content, n, c ]
    ((self 'all)   [ c_ns_properties, n, c ]
      ((self 'any)   ((self 'all)   [ s_separate, n, c ]
          [ ns_flow_content, n, c ])
        e_scalar))))



; [162]
; c-b-block-header(m,t) ::=
;   ( ( c-indentation-indicator(m)
;   c-chomping-indicator(t) )
;   | ( c-chomping-indicator(t)
;   c-indentation-indicator(m) ) )
;   s-b-comment

(define (c_b_block_header self n)
  (when +debug+ (debug-rule "c_b_block_header",n))
  ((self 'all)   ((self 'any)   ((self 'all)   [ c_indentation_indicator, n ]
        c_chomping_indicator
        ((self 'chk)   '='
          ((self 'any)   end_of_stream
            s_white
            b_break)))
      ((self 'all)   c_chomping_indicator
        [ c_indentation_indicator, n ]
        ((self 'chk)   '='
          ((self 'any)   end_of_stream
            s_white
            b_break))))
    s_b_comment))



; [163]
; c-indentation-indicator(m) ::=
;   ( ns-dec-digit => m = ns-dec-digit - x:30 )
;   ( <empty> => m = auto-detect() )

(define (c_indentation_indicator self n)
  (when +debug+ (debug-rule "c_indentation_indicator",n))
  ((self 'any)   ((self 'if) ((self 'rng) "\x{31}" "\x{39}") ((self 'set) 'm' ((self 'ord) match)))
    ((self 'if) empty ((self 'set) 'm' [ auto_detect, n ]))))



; [164]
; c-chomping-indicator(t) ::=
;   ( '-' => t = strip )
;   ( '+' => t = keep )
;   ( <empty> => t = clip )

(define (c_chomping_indicator self)
  (when +debug+ (debug-rule "c_chomping_indicator"))
  ((self 'any)   ((self 'if) ((self 'chr) '-') ((self 'set) 't' "strip"))
    ((self 'if) ((self 'chr) '+') ((self 'set) 't' "keep"))
    ((self 'if) empty ((self 'set) 't' "clip"))))



; [165]
; b-chomped-last(t) ::=
;   ( t = strip => b-non-content | <end_of_file> )
;   ( t = clip => b-as-line-feed | <end_of_file> )
;   ( t = keep => b-as-line-feed | <end_of_file> )

(define (b_chomped_last self t)
  (when +debug+ (debug-rule "b_chomped_last",t))
  ((self 'case)   t
    {
      'clip' => ((self 'any) b_as_line_feed end_of_stream),
      'keep' => ((self 'any) b_as_line_feed end_of_stream),
      'strip' => ((self 'any) b_non_content end_of_stream),
    }))



; [166]
; l-chomped-empty(n,t) ::=
;   ( t = strip => l-strip-empty(n) )
;   ( t = clip => l-strip-empty(n) )
;   ( t = keep => l-keep-empty(n) )

(define (l_chomped_empty self n t)
  (when +debug+ (debug-rule "l_chomped_empty",nt))
  ((self 'case)   t
    {
      'clip' => [ l_strip_empty, n ],
      'keep' => [ l_keep_empty, n ],
      'strip' => [ l_strip_empty, n ],
    }))



; [167]
; l-strip-empty(n) ::=
;   ( s-indent(<=n) b-non-content )*
;   l-trail-comments(n)?

(define (l_strip_empty self n)
  (when +debug+ (debug-rule "l_strip_empty",n))
  ((self 'all)   ((self 'rep)   0
      #f
      ((self 'all)   [ s_indent_le, n ]
        b_non_content))
    ((self 'rep) 0 1 [ l_trail_comments, n ])))



; [168]
; l-keep-empty(n) ::=
;   l-empty(n,block-in)*
;   l-trail-comments(n)?

(define (l_keep_empty self n)
  (when +debug+ (debug-rule "l_keep_empty",n))
  ((self 'all)   ((self 'rep) 0 #f [ l_empty, n, "block-in" ])
    ((self 'rep) 0 1 [ l_trail_comments, n ])))



; [169]
; l-trail-comments(n) ::=
;   s-indent(<n)
;   c-nb-comment-text b-comment
;   l-comment*

(define (l_trail_comments self n)
  (when +debug+ (debug-rule "l_trail_comments",n))
  ((self 'all)   [ s_indent_lt, n ]
    c_nb_comment_text
    b_comment
    ((self 'rep) 0 #f l_comment)))



; [170]
; c-l+literal(n) ::=
;   '|' c-b-block-header(m,t)
;   l-literal-content(n+m,t)

(define (c_l_literal self n)
  (when +debug+ (debug-rule "c_l_literal",n))
  ((self 'all)   ((self 'chr) '|')
    [ c_b_block_header, n ]
    [ l_literal_content, ((self 'add) n ((self 'm) )), ((self 't) ) ]))



; [171]
; l-nb-literal-text(n) ::=
;   l-empty(n,block-in)*
;   s-indent(n) nb-char+

(define (l_nb_literal_text self n)
  (when +debug+ (debug-rule "l_nb_literal_text",n))
  ((self 'all)   ((self 'rep) 0 #f [ l_empty, n, "block-in" ])
    [ s_indent, n ]
    ((self 'rep) 1 #f nb_char)))



; [172]
; b-nb-literal-next(n) ::=
;   b-as-line-feed
;   l-nb-literal-text(n)

(define (b_nb_literal_next self n)
  (when +debug+ (debug-rule "b_nb_literal_next",n))
  ((self 'all)   b_as_line_feed
    [ l_nb_literal_text, n ]))



; [173]
; l-literal-content(n,t) ::=
;   ( l-nb-literal-text(n)
;   b-nb-literal-next(n)*
;   b-chomped-last(t) )?
;   l-chomped-empty(n,t)

(define (l_literal_content self n t)
  (when +debug+ (debug-rule "l_literal_content",nt))
  ((self 'all)   ((self 'rep)   0
      1
      ((self 'all)   [ l_nb_literal_text, n ]
        ((self 'rep) 0 #f [ b_nb_literal_next, n ])
        [ b_chomped_last, t ]))
    [ l_chomped_empty, n, t ]))



; [174]
; c-l+folded(n) ::=
;   '>' c-b-block-header(m,t)
;   l-folded-content(n+m,t)

(define (c_l_folded self n)
  (when +debug+ (debug-rule "c_l_folded",n))
  ((self 'all)   ((self 'chr) '>')
    [ c_b_block_header, n ]
    [ l_folded_content, ((self 'add) n ((self 'm) )), ((self 't) ) ]))



; [175]
; s-nb-folded-text(n) ::=
;   s-indent(n) ns-char
;   nb-char*

(define (s_nb_folded_text self n)
  (when +debug+ (debug-rule "s_nb_folded_text",n))
  ((self 'all)   [ s_indent, n ]
    ns_char
    ((self 'rep) 0 #f nb_char)))



; [176]
; l-nb-folded-lines(n) ::=
;   s-nb-folded-text(n)
;   ( b-l-folded(n,block-in) s-nb-folded-text(n) )*

(define (l_nb_folded_lines self n)
  (when +debug+ (debug-rule "l_nb_folded_lines",n))
  ((self 'all)   [ s_nb_folded_text, n ]
    ((self 'rep)   0
      #f
      ((self 'all)   [ b_l_folded, n, "block-in" ]
        [ s_nb_folded_text, n ]))))



; [177]
; s-nb-spaced-text(n) ::=
;   s-indent(n) s-white
;   nb-char*

(define (s_nb_spaced_text self n)
  (when +debug+ (debug-rule "s_nb_spaced_text",n))
  ((self 'all)   [ s_indent, n ]
    s_white
    ((self 'rep) 0 #f nb_char)))



; [178]
; b-l-spaced(n) ::=
;   b-as-line-feed
;   l-empty(n,block-in)*

(define (b_l_spaced self n)
  (when +debug+ (debug-rule "b_l_spaced",n))
  ((self 'all)   b_as_line_feed
    ((self 'rep) 0 #f [ l_empty, n, "block-in" ])))



; [179]
; l-nb-spaced-lines(n) ::=
;   s-nb-spaced-text(n)
;   ( b-l-spaced(n) s-nb-spaced-text(n) )*

(define (l_nb_spaced_lines self n)
  (when +debug+ (debug-rule "l_nb_spaced_lines",n))
  ((self 'all)   [ s_nb_spaced_text, n ]
    ((self 'rep)   0
      #f
      ((self 'all)   [ b_l_spaced, n ]
        [ s_nb_spaced_text, n ]))))



; [180]
; l-nb-same-lines(n) ::=
;   l-empty(n,block-in)*
;   ( l-nb-folded-lines(n) | l-nb-spaced-lines(n) )

(define (l_nb_same_lines self n)
  (when +debug+ (debug-rule "l_nb_same_lines",n))
  ((self 'all)   ((self 'rep) 0 #f [ l_empty, n, "block-in" ])
    ((self 'any)   [ l_nb_folded_lines, n ]
      [ l_nb_spaced_lines, n ])))



; [181]
; l-nb-diff-lines(n) ::=
;   l-nb-same-lines(n)
;   ( b-as-line-feed l-nb-same-lines(n) )*

(define (l_nb_diff_lines self n)
  (when +debug+ (debug-rule "l_nb_diff_lines",n))
  ((self 'all)   [ l_nb_same_lines, n ]
    ((self 'rep)   0
      #f
      ((self 'all)   b_as_line_feed
        [ l_nb_same_lines, n ]))))



; [182]
; l-folded-content(n,t) ::=
;   ( l-nb-diff-lines(n)
;   b-chomped-last(t) )?
;   l-chomped-empty(n,t)

(define (l_folded_content self n t)
  (when +debug+ (debug-rule "l_folded_content",nt))
  ((self 'all)   ((self 'rep)   0
      1
      ((self 'all)   [ l_nb_diff_lines, n ]
        [ b_chomped_last, t ]))
    [ l_chomped_empty, n, t ]))



; [183]
; l+block-sequence(n) ::=
;   ( s-indent(n+m)
;   c-l-block-seq-entry(n+m) )+
;   <for_some_fixed_auto-detected_m_>_0>

(define (l_block_sequence self n)
  (when +debug+ (debug-rule "l_block_sequence",n))
  ((self 'all)   ((self 'rep)   1
      #f
      ((self 'all)   [ s_indent, ((self 'add) n m) ]
        [ c_l_block_seq_entry, ((self 'add) n m) ]))))



; [184]
; c-l-block-seq-entry(n) ::=
;   '-' <not_followed_by_an_ns-char>
;   s-l+block-indented(n,block-in)

(define (c_l_block_seq_entry self n)
  (when +debug+ (debug-rule "c_l_block_seq_entry",n))
  ((self 'all)   ((self 'chr) '-')
    ((self 'chk) '!' ns_char)
    [ s_l_block_indented, n, "block-in" ]))



; [185]
; s-l+block-indented(n,c) ::=
;   ( s-indent(m)
;   ( ns-l-compact-sequence(n+1+m)
;   | ns-l-compact-mapping(n+1+m) ) )
;   | s-l+block-node(n,c)
;   | ( e-node s-l-comments )

(define (s_l_block_indented self n c)
  (when +debug+ (debug-rule "s_l_block_indented",nc))
  ((self 'any)   ((self 'all)   [ s_indent, m ]
      ((self 'any)   [ ns_l_compact_sequence, ((self 'add) n ((self 'add) 1 m)) ]
        [ ns_l_compact_mapping, ((self 'add) n ((self 'add) 1 m)) ]))
    [ s_l_block_node, n, c ]
    ((self 'all)   e_node
      s_l_comments)))



; [186]
; ns-l-compact-sequence(n) ::=
;   c-l-block-seq-entry(n)
;   ( s-indent(n) c-l-block-seq-entry(n) )*

(define (ns_l_compact_sequence self n)
  (when +debug+ (debug-rule "ns_l_compact_sequence",n))
  ((self 'all)   [ c_l_block_seq_entry, n ]
    ((self 'rep)   0
      #f
      ((self 'all)   [ s_indent, n ]
        [ c_l_block_seq_entry, n ]))))



; [187]
; l+block-mapping(n) ::=
;   ( s-indent(n+m)
;   ns-l-block-map-entry(n+m) )+
;   <for_some_fixed_auto-detected_m_>_0>

(define (l_block_mapping self n)
  (when +debug+ (debug-rule "l_block_mapping",n))
  ((self 'all)   ((self 'rep)   1
      #f
      ((self 'all)   [ s_indent, ((self 'add) n m) ]
        [ ns_l_block_map_entry, ((self 'add) n m) ]))))



; [188]
; ns-l-block-map-entry(n) ::=
;   c-l-block-map-explicit-entry(n)
;   | ns-l-block-map-implicit-entry(n)

(define (ns_l_block_map_entry self n)
  (when +debug+ (debug-rule "ns_l_block_map_entry",n))
  ((self 'any)   [ c_l_block_map_explicit_entry, n ]
    [ ns_l_block_map_implicit_entry, n ]))



; [189]
; c-l-block-map-explicit-entry(n) ::=
;   c-l-block-map-explicit-key(n)
;   ( l-block-map-explicit-value(n)
;   | e-node )

(define (c_l_block_map_explicit_entry self n)
  (when +debug+ (debug-rule "c_l_block_map_explicit_entry",n))
  ((self 'all)   [ c_l_block_map_explicit_key, n ]
    ((self 'any)   [ l_block_map_explicit_value, n ]
      e_node)))



; [190]
; c-l-block-map-explicit-key(n) ::=
;   '?'
;   s-l+block-indented(n,block-out)

(define (c_l_block_map_explicit_key self n)
  (when +debug+ (debug-rule "c_l_block_map_explicit_key",n))
  ((self 'all)   ((self 'chr) '?')
    ((self 'chk)   '='
      ((self 'any)   end_of_stream
        s_white
        b_break))
    [ s_l_block_indented, n, "block-out" ]))



; [191]
; l-block-map-explicit-value(n) ::=
;   s-indent(n)
;   ':' s-l+block-indented(n,block-out)

(define (l_block_map_explicit_value self n)
  (when +debug+ (debug-rule "l_block_map_explicit_value",n))
  ((self 'all)   [ s_indent, n ]
    ((self 'chr) ':')
    [ s_l_block_indented, n, "block-out" ]))



; [192]
; ns-l-block-map-implicit-entry(n) ::=
;   (
;   ns-s-block-map-implicit-key
;   | e-node )
;   c-l-block-map-implicit-value(n)

(define (ns_l_block_map_implicit_entry self n)
  (when +debug+ (debug-rule "ns_l_block_map_implicit_entry",n))
  ((self 'all)   ((self 'any)   ns_s_block_map_implicit_key
      e_node)
    [ c_l_block_map_implicit_value, n ]))



; [193]
; ns-s-block-map-implicit-key ::=
;   c-s-implicit-json-key(block-key)
;   | ns-s-implicit-yaml-key(block-key)

(define (ns_s_block_map_implicit_key self)
  (when +debug+ (debug-rule "ns_s_block_map_implicit_key"))
  ((self 'any)   [ c_s_implicit_json_key, "block-key" ]
    [ ns_s_implicit_yaml_key, "block-key" ]))



; [194]
; c-l-block-map-implicit-value(n) ::=
;   ':' (
;   s-l+block-node(n,block-out)
;   | ( e-node s-l-comments ) )

(define (c_l_block_map_implicit_value self n)
  (when +debug+ (debug-rule "c_l_block_map_implicit_value",n))
  ((self 'all)   ((self 'chr) ':')
    ((self 'any)   [ s_l_block_node, n, "block-out" ]
      ((self 'all)   e_node
        s_l_comments))))



; [195]
; ns-l-compact-mapping(n) ::=
;   ns-l-block-map-entry(n)
;   ( s-indent(n) ns-l-block-map-entry(n) )*

(define (ns_l_compact_mapping self n)
  (when +debug+ (debug-rule "ns_l_compact_mapping",n))
  ((self 'all)   [ ns_l_block_map_entry, n ]
    ((self 'rep)   0
      #f
      ((self 'all)   [ s_indent, n ]
        [ ns_l_block_map_entry, n ]))))



; [196]
; s-l+block-node(n,c) ::=
;   s-l+block-in-block(n,c) | s-l+flow-in-block(n)

(define (s_l_block_node self n c)
  (when +debug+ (debug-rule "s_l_block_node",nc))
  ((self 'any)   [ s_l_block_in_block, n, c ]
    [ s_l_flow_in_block, n ]))



; [197]
; s-l+flow-in-block(n) ::=
;   s-separate(n+1,flow-out)
;   ns-flow-node(n+1,flow-out) s-l-comments

(define (s_l_flow_in_block self n)
  (when +debug+ (debug-rule "s_l_flow_in_block",n))
  ((self 'all)   [ s_separate, ((self 'add) n 1), "flow-out" ]
    [ ns_flow_node, ((self 'add) n 1), "flow-out" ]
    s_l_comments))



; [198]
; s-l+block-in-block(n,c) ::=
;   s-l+block-scalar(n,c) | s-l+block-collection(n,c)

(define (s_l_block_in_block self n c)
  (when +debug+ (debug-rule "s_l_block_in_block",nc))
  ((self 'any)   [ s_l_block_scalar, n, c ]
    [ s_l_block_collection, n, c ]))



; [199]
; s-l+block-scalar(n,c) ::=
;   s-separate(n+1,c)
;   ( c-ns-properties(n+1,c) s-separate(n+1,c) )?
;   ( c-l+literal(n) | c-l+folded(n) )

(define (s_l_block_scalar self n c)
  (when +debug+ (debug-rule "s_l_block_scalar",nc))
  ((self 'all)   [ s_separate, ((self 'add) n 1), c ]
    ((self 'rep)   0
      1
      ((self 'all)   [ c_ns_properties, ((self 'add) n 1), c ]
        [ s_separate, ((self 'add) n 1), c ]))
    ((self 'any)   [ c_l_literal, n ]
      [ c_l_folded, n ])))



; [200]
; s-l+block-collection(n,c) ::=
;   ( s-separate(n+1,c)
;   c-ns-properties(n+1,c) )?
;   s-l-comments
;   ( l+block-sequence(seq-spaces(n,c))
;   | l+block-mapping(n) )

(define (s_l_block_collection self n c)
  (when +debug+ (debug-rule "s_l_block_collection",nc))
  ((self 'all)   ((self 'rep)   0
      1
      ((self 'all)   [ s_separate, ((self 'add) n 1), c ]
        ((self 'any)   ((self 'all)   [ c_ns_properties, ((self 'add) n 1), c ]
            s_l_comments)
          ((self 'all)   c_ns_tag_property
            s_l_comments)
          ((self 'all)   c_ns_anchor_property
            s_l_comments))))
    s_l_comments
    ((self 'any)   [ l_block_sequence, [ seq_spaces, n, c ] ]
      [ l_block_mapping, n ])))



; [201]
; seq-spaces(n,c) ::=
;   ( c = block-out => n-1 )
;   ( c = block-in => n )

(define (seq_spaces self n c)
  (when +debug+ (debug-rule "seq_spaces",nc))
  ((self 'flip)   c
    {
      'block-in' => n,
      'block-out' => ((self 'sub) n 1),
    }))



; [202]
; l-document-prefix ::=
;   c-byte-order-mark? l-comment*

(define (l_document_prefix self)
  (when +debug+ (debug-rule "l_document_prefix"))
  ((self 'all)   ((self 'rep) 0 1 c_byte_order_mark)
    ((self 'rep) 0 #f l_comment)))



; [203]
; c-directives-end ::=
;   '-' '-' '-'

(define (c_directives_end self)
  (when +debug+ (debug-rule "c_directives_end"))
  ((self 'all)   ((self 'chr) '-')
    ((self 'chr) '-')
    ((self 'chr) '-')
    ((self 'chk)   '='
      ((self 'any)   end_of_stream
        s_white
        b_break))))



; [204]
; c-document-end ::=
;   '.' '.' '.'

(define (c_document_end self)
  (when +debug+ (debug-rule "c_document_end"))
  ((self 'all)   ((self 'chr) '.')
    ((self 'chr) '.')
    ((self 'chr) '.')))



; [205]
; l-document-suffix ::=
;   c-document-end s-l-comments

(define (l_document_suffix self)
  (when +debug+ (debug-rule "l_document_suffix"))
  ((self 'all)   c_document_end
    s_l_comments))



; [206]
; c-forbidden ::=
;   <start_of_line>
;   ( c-directives-end | c-document-end )
;   ( b-char | s-white | <end_of_file> )

(define (c_forbidden self)
  (when +debug+ (debug-rule "c_forbidden"))
  ((self 'all)   start_of_line
    ((self 'any)   c_directives_end
      c_document_end)
    ((self 'any)   b_char
      s_white
      end_of_stream)))



; [207]
; l-bare-document ::=
;   s-l+block-node(-1,block-in)
;   <excluding_c-forbidden_content>

(define (l_bare_document self)
  (when +debug+ (debug-rule "l_bare_document"))
  ((self 'all)   ((self 'exclude) c_forbidden)
    [ s_l_block_node, -1, "block-in" ]))



; [208]
; l-explicit-document ::=
;   c-directives-end
;   ( l-bare-document
;   | ( e-node s-l-comments ) )

(define (l_explicit_document self)
  (when +debug+ (debug-rule "l_explicit_document"))
  ((self 'all)   c_directives_end
    ((self 'any)   l_bare_document
      ((self 'all)   e_node
        s_l_comments))))



; [209]
; l-directive-document ::=
;   l-directive+
;   l-explicit-document

(define (l_directive_document self)
  (when +debug+ (debug-rule "l_directive_document"))
  ((self 'all)   ((self 'rep) 1 #f l_directive)
    l_explicit_document))



; [210]
; l-any-document ::=
;   l-directive-document
;   | l-explicit-document
;   | l-bare-document

(define (l_any_document self)
  (when +debug+ (debug-rule "l_any_document"))
  ((self 'any)   l_directive_document
    l_explicit_document
    l_bare_document))



; [211]
; l-yaml-stream ::=
;   l-document-prefix* l-any-document?
;   ( ( l-document-suffix+ l-document-prefix*
;   l-any-document? )
;   | ( l-document-prefix* l-explicit-document? ) )*

(define (l_yaml_stream self)
  (when +debug+ (debug-rule "l_yaml_stream"))
  ((self 'all)   l_document_prefix
    ((self 'rep) 0 1 l_any_document)
    ((self 'rep)   0
      #f
      ((self 'any)   ((self 'all)   l_document_suffix
          ((self 'rep) 0 #f l_document_prefix)
          ((self 'rep) 0 1 l_any_document))
        ((self 'all)   l_document_prefix
          ((self 'rep) 0 1 l_explicit_document))))))

