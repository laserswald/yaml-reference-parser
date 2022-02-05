require '../../coffeescript/lib/prelude'

global.YamlGrammarGenerator = class YamlGrammarGenerator
  constructor: (spec)->
    @spec = require('yaml').parse spec
    @comments = @get_comments spec
    @num = 0
    @grammar = ''
    @arg = false
    @group = false
    @nums = _.keys(@spec) \
      .filter (k)->
        k[0] == ':'
      .reduce (n, k)=>
        n[@spec[k]] = k
        return n
      , {}

  gen_grammar: (top)->
    @out @gen_grammar_head top

    for name in _.keys(@spec)
      continue if name[0] == ':'
      @out @gen_rule(name)

    @out @gen_grammar_tail()

    @grammar

  for_each_rule: (fn) ->
    for name in _.keys(@spec)
      continue if name[0] == ':'
      rule = @read_rule name
      fn(rule)

  gen_grammar_head: -> @not_implemented('gen_grammar_head')

  gen_grammar_info: ->
    @gen_comment_block(
      """\
      This grammar class was generated from https://yaml.org/spec/1.2/spec.html
      """
    ) + "\n"

  gen_grammar_tail: => ''

  read_rule: (name) ->
    @setm = ''
    if @spec[name]['(->m)']
      delete @spec[name]['(->m)']
      @setm = @gen_setm false
    else if @spec[name]['(m>0)']
      delete @spec[name]['(m>0)']
      @setm = @gen_setm true


    num = @num = @nums[name][1..]

    return
      num: num
      comment: @comments[num]
      rule_name: @rule_name name
      debug_args: @gen_debug_args name
      rule_args: @gen_rule_args name
      rule_body: @indent(@gen @spec[name])

  gen_rule: (name)->
    rule = @read_rule name
    @gen_rule_code rule.num,
      rule.comment,
      rule.rule_name,
      rule.debug_args,
      rule.rule_args,
      rule.rule_body

  gen_rule_code: -> @not_implemented('gen_rule_code')

  gen_rule_args: -> @not_implemented('gen_rule_args')

  gen_debug_args: -> @not_implemented('gen_debug_args')

  gen: (rule)->
    if isObject rule
      return @gen_from_hash rule

    if isArray rule
      return @gen_from_array rule

    if isString rule
      return @gen_from_string rule

    if isNumber rule
      return "#{rule}"

    if rule == null
      return @gen_null()

    xxx "[#{@num}] unknown rule type", rule

  gen_from_hash: (rule)->
    set = rule['(set)']

    keys = _.keys rule
    if keys.length > 1 and not set?
      XXX ["[#{@num}] unknown keys", keys]

    key = keys[0]
    val = rule[key]

    if m = key.match /^\(\{(.)\}\)$/
      return @gen_rep val, m[1], m[1]

    if m = key.match /^(([bcls]|n[bs]|in|seq)[-+][-+a-z]+)$/
      return @gen_call key, val

    if key == 'auto-detect'
      return @gen_call key, val

    switch key
      when '(any)'  then return @gen_group val, 'any'
      when '(all)'  then return @gen_group val, 'all'
      when '(---)'  then return @gen_group val, 'but'

      when '(+++)'  then return @gen_rep val, 1, null
      when '(***)'  then return @gen_rep val, 0, null
      when '(???)'  then return @gen_rep val, 0, 1

      when '(<<<)'  then return @gen_may val
      when '(===)'  then return @gen_chk val, '='
      when '(!==)'  then return @gen_chk val, '!'
      when '(<==)'  then return @gen_chk val, '<='

      when '(+)'    then return @gen_add val
      when '(-)'    then return @gen_sub val
      when '(<)'    then return @gen_lt val
      when '(<=)'   then return @gen_le val

      when '(case)' then return @gen_case val
      when '(flip)' then return @gen_flip val
      when '(max)'  then return @gen_max val
      when '(if)'   then return @gen_if val, set
      when '(set)'  then return @gen_set val
      when '(ord)'  then return @gen_ord val
      when '(len)'  then return @gen_len val
      when '(exclude)' then return @gen_exclude val

      else XXX "[#{@num}] unknown hash rule", rule, @num

  gen_from_array: (rule)->
    if rule.length == 2 and rule[0].match /^x/
      [x, y] = rule
      return @gen_method_call 'rng',
        @gen_hex_code(x[1..]),
        @gen_hex_code(y[1..])

    xxx "[#{@num}] Unknown array rule type", rule


  gen_from_string: (rule)->
    if m = rule.match /^x([0-9A-F]+)$/
      return @gen_method_call 'chr', @gen_hex_code m[1]
    if rule.match(/^(?:b|c|e|l|nb|ns|s)(?:[-+][a-z0-9]+)+$/)
      return @gen_method_ref @rule_name rule
    if rule.length == 1
      return @gen_char rule
    if rule.match(/^(flow|block)-(in|out|key)$/) or
      rule in ['auto-detect', 'strip', 'clip', 'keep']
        return '"' + rule + '"'
    if m = rule.match /^<(\w.+)>$/
      return @gen_method_ref @rule_name m[1]
    if rule == '(match)'
      return @gen_method_ref 'match'

    xxx "[#{@num}] Unknown string rule type", rule

  gen_char: (rule) ->
    if rule == "'"
      return @gen_method_call 'chr', "\"'\""
    if rule == "\\"
      return @gen_method_call 'chr', "\"\\\\\""
    if @arg
      if rule in ['m', 't']
        if not(rule in @args) and not(@setm)
          return @gen_method_call rule
      return @gen_var_value rule
    return @gen_method_call 'chr', "'#{rule}'"

  gen_var_value: (var_)-> var_

  gen_group: (list, kind)->
    list = list.map (item)=> @gen(item)
    @group = true
    out = @gen_method_call(kind, list...)
    @group = false
    @fix_group out

  gen_rep: (rule, min, max)->
    @gen_method_call('rep', @gen_limit(min), @gen_limit(max), @gen(rule))
      .replace /\(\n  (-?\d+),\n  (null|-?\d+),/, "($1, $2,"
      .replace /\)\n\)/, '))'

  gen_limit: (n)-> n

  gen_call: (call, args)->
    args = [ args ] unless isArray args

    list = args.map (arg)=> @gen_arg arg
    list = list.join ', '

    ref = @gen_method_ref @rule_name call

    "[ #{ref}, #{list} ]"

  gen_may: (rule)->
    @gen_method_call 'may', @gen(rule)

  gen_chk: (rule, kind)->
    @gen_method_call 'chk', "'#{kind}'", @gen(rule)

  gen_case: (obj)->
    var_ = obj.var
    delete obj.var
    @gen_method_call 'case',
      @gen_var_value(var_),
      @gen_hash(obj)

  gen_hash: (obj)->
    out = "{\n"
    for key, val of obj
      rule = @gen(val)
        .replace(/\s+/g, ' ')
        .replace(/,\ \)/, ' )')
      out += @indent "'#{key}'#{@gen_pair_sep()}#{rule},\n"
    out + "}"

  gen_flip: (obj)->
    var_ = obj.var
    hash = "{\n"
    delete obj.var
    for key, val of obj
      rule = @gen_arg val
      hash += "  '#{key}'#{@gen_pair_sep()}#{rule},\n"
    hash += "}"
    @gen_method_call 'flip',
      @gen_var_value(var_),
      hash

  gen_max: (max)->
    @gen_method_call 'max', max

  gen_if: (cond, set)->
    @gen_method_call 'if', @gen(cond), @gen_set(set)

  gen_set: ([vari, expr])->
    @gen_method_call 'set', "'#{vari}'", @gen(expr)

  gen_ord: (expr)->
    @gen_method_call 'ord', @gen(expr)

  gen_len: (expr)->
    @gen_method_call 'len', @gen(expr)

  gen_exclude: (rule)->
    @gen_method_call 'exclude', @gen(rule)

  gen_add: ([x, y])->
    @gen_method_call 'add', @gen(x), @gen(y)

  gen_sub: ([x, y])->
    @gen_method_call 'sub', @gen(x), @gen(y)

  gen_lt: ([x, y])->
    @gen_method_call 'lt', @gen_arg(x), @gen_arg(y)

  gen_le: ([x, y])->
    @gen_method_call 'le', @gen_arg(x), @gen_arg(y)

  gen_null: -> @not_implemented('gen_null')

  gen_method_call: -> @not_implemented('gen_method_call')

  gen_method_call_args: (args)->
    multiline = false
    sep = ''

    for arg in args
      if @group
        multiline = true
      else if isString(arg)
        if arg.match(/\n/)
          multiline = true
    if multiline
      sep = "\n"
      args = args.map (a)=>
        @indent @string a
      args = args.join("#{@arg_seperator}#{sep}")
    else
      args = args.map (a)=>
        @string a
      args = args.join("#{@arg_seperator} ")

    return [args, sep]

  arg_seperator: ","

  gen_arg: (arg)->
    @arg = true
    arg = @gen arg
    @arg = false
    arg

  out: (text)->
    @grammar += text

  string: (o)->
    if o?
      String o
    else
      @gen_null()

  indent: (text, n=1)->
    text.replace(/^(.)/gm, "#{_.repeat('  ', n)}$1")

  rule_name: (name)->
    name.replace /[-+]/g, '_'

  get_comments: (spec)->
    comments = {}
    lines = spec.split "\n"
    while (line = lines.shift())?
      if m = line.match /^:(\d+):/
        num = m[1]
        key = "#{num}"
        comments[key] = "#{@comment_char} [#{num}]\n"
        while (line = lines.shift())?
          break unless line.match /^# /
          comments[key] += (line + '\n').replace /^#/, "#{@comment_char}"
    comments

  comment_char: "#"

  not_implemented: (method)->
    class_ = @constructor.name
    die "Class '#{class_}' does not implement '#{method}'"

# vim: set sw=2:
