require './generate-yaml-grammar'

global.generator_class = \
  class YamlGrammarSchemeGenerator \
  extends YamlGrammarGenerator

  comment_char: ";"
  arg_seperator: ""

  gen_grammar_head: (top)->
    name = @rule_name top
    """\
    #{@gen_grammar_info()}

    (import (scheme base)
            (scheme read)
            (scheme write))

    (include \"prelude.scm\")

    (define +debug+ (get-environment-variable \"DEBUG\"))

    \n\n
    """

  gen_operator_defs: ->
    op_defs = ""
    @for_each_rule (rule) =>
      op_def = @gen_operator(rule)
      op_defs += "#{op_def}\n"

  gen_operator: (rule) ->
    """
    (define-operation (#{rule.rule_name} #{rule.rule_args}))
    """

  gen_grammar_tail: ->
    """
    """

  gen_setm: (return_false)->
    # setm = "\n  my $m = $self->call([$self->func('auto_detect_indent'), $n], 'number');"
    # if return_false
    #   setm = setm.replace /;/, " or return false;"
    # return setm
    "(set! m (apply auto-detect-indent n))"

  gen_rule_code: (num, comment, rule_name, debug_args, rule_args, rule_body)->
    """\
    #{comment}
    (define (#{rule_name} #{rule_args})
      (when +debug+
        (debug-rule \"#{rule_name}\"#{debug_args}))
    #{rule_body})
    \n\n\n
    """

  gen_rep: (rule, min, max)->
    @gen_method_call('rep', @gen_limit(min), @gen_limit(max), @gen(rule))
      .replace /\(\n  (-?\d+),\n  (undef|-?\d+),/, "($1, $2,"
      .replace /\)\n\)/, '))'

  gen_rule_args: (name)->
    rule = @spec[name] or XXX name
    return 'self' unless _.isPlainObject rule
    args = rule['(...)']
    return 'self' unless args?
    delete rule['(...)']
    @args = args
    args = [ args ] unless _.isArray args
    args = _.map args, (a)-> if a? then "#{a}" else '#f'
    args.unshift 'self'
    "#{args.join ' '}"

  gen_debug_args: (name)->
    rule = @spec[name] or XXX name
    return '' unless _.isPlainObject rule

    args = rule['(...)']
    return '' unless args?

    args = [ args ] unless _.isArray args
    args = _.map args, (a)-> if a? then "#{a}" else '#f'
    str = ',' + args.join(' ')
      .replace /\ /g, ''
      .replace /^\(\)$/, ''

  gen_hex_code: (hex)-> "#\\x#{hex}"

  gen_var_value: (var_)-> "#{var_}"

  gen_char: (rule) ->
    if rule == "'"
      return @gen_method_call 'chr', "#\\'"
    if rule == "\\"
      return @gen_method_call 'chr', "#\\\\"
    if @arg
      if rule in ['m', 't']
        if not(rule in @args) and not(@setm)
          return @gen_method_call rule
      return @gen_var_value rule
    return @gen_method_call 'chr', "#\\#{rule}"

  gen_limit: (n)->
    if _.isNumber n then n else if n? then "#{n}" else '#f'

  gen_pair_sep: -> ' => '

  gen_null: -> '#f'

  gen_call: (call, args)->
    args = [ args ] unless isArray args

    list = args.map (arg)=> @gen_arg arg
    list = list.join ' '

    ref = @gen_method_ref @rule_name call

    "(#{ref} #{list})"

  gen_method_call: (method, args...)->
    [args, sep] = @gen_method_call_args args
    if @group
      callstr = "(#{method} "
      callstr += @indent args, 1
      callstr += ")"
    else
      "(#{method} #{args})"

  gen_method_ref: (name)->
    if name == 'auto_detect_indent'
      "(lambda () (#{name} n))"
    else
      "#{name}"

  gen_comment_block: (text)->
    text = text
      .replace /^/mg, ';;; '
      .replace /\n$/, ''
    """\
    ;;;
    #{text}
    ;;;
    """

  fix_group: (text)->
    i = 0
    text.replace /^  \$self->rep/mg, (m...)->
      m[0] + (if i++ then String(i) else '')

  gen_case: (obj)->
    var_ = obj.var
    delete obj.var
    @gen_method_call 'parse-case',
      @gen_var_value(var_),
      @case_clauses(obj)

  case_clauses: (obj)->
    out = "'(\n"
    for key, val of obj
      rule = @gen(val)
        .replace(/\s+/g, ' ')
        .replace(/,\ \)/, ' )')
      out += @indent "(#{key} . #{rule})\n"
    out + ")"

  rule_name: (name) -> "yaml-parser-parse!/" + name

# vim: set sw=2:
