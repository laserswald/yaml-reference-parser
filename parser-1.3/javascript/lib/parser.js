// Generated by CoffeeScript 2.5.1
(function() {
  /*
  This is a parser class. It has a parse() method and parsing primitives for the
  grammar. It calls methods in the receiver class, when a rule matches:
  */
  var DEBUG, Parser, STATS, TRACE,
    indexOf = [].indexOf;

  require('./prelude');

  require('./grammar');

  DEBUG = Boolean(ENV.DEBUG);

  TRACE = Boolean(ENV.TRACE);

  STATS = Boolean(ENV.STATS);

  global.Parser = Parser = (function() {
    var make;

    class Parser extends Grammar {
      constructor(receiver) {
        var f, j, len1, make_method, method_name, ref;
        super();
        receiver.parser = this;
        this.receiver = receiver;
        this.pos = 0;
        this.end = 0;
        this.state = [];
        if (DEBUG || TRACE || STATS) {
          this.call = this.call_debug;
          this.trace_num = 0;
          this.trace_line = 0;
          this.trace_on = true;
          this.trace_off = 0;
          this.trace_info = ['', '', ''];
          make_method = function(name, method) {
            return function(...a) {
              var fn1, fn2;
              fn1 = method.call(this, ...a);
              if (isFunction(fn1)) {
                fn2 = function() {
                  return fn1;
                };
                Object.defineProperty(fn2, 'name', {
                  value: fn1.name
                });
                Object.defineProperty(fn1, 'name', {
                  value: name
                });
                return fn2;
              }
              return fn1;
            };
          };
          ref = Object.getOwnPropertyNames(Grammar.prototype);
          for (j = 0, len1 = ref.length; j < len1; j++) {
            method_name = ref[j];
            if (method_name === 'constructor') {
              continue;
            }
            if ((f = String(Grammar.prototype[method_name])).match(/^\w+\(\)/)) {
              continue;
            }
            Grammar.prototype[method_name] = make_method(method_name, Grammar.prototype[method_name]);
          }
        }
      }

      parse(input1) {
        var err, ok;
        this.input = input1;
        if (!(this.input.length === 0 || this.input.endsWith("\n"))) {
          this.input += "\n";
        }
        this.end = this.input.length;
        if (TRACE) {
          this.trace_on = !this.trace_start();
        }
        try {
          ok = this.call(this.TOP);
          if (TRACE) {
            this.trace_flush();
          }
        } catch (error) {
          err = error;
          if (TRACE) {
            this.trace_flush();
          }
          throw err;
        }
        if (!ok) {
          throw "Parser failed";
        }
        if (this.pos < this.end) {
          throw "Parser finished before end of input";
        }
        return true;
      }

      state_curr() {
        return this.state[this.state.length - 1] || {
          name: null,
          doc: false,
          lvl: 0,
          beg: 0,
          end: 0,
          m: null,
          t: null
        };
      }

      state_prev() {
        return this.state[this.state.length - 2];
      }

      state_push(name) {
        var curr;
        curr = this.state_curr();
        return this.state.push({
          name: name,
          doc: curr.doc,
          lvl: curr.lvl + 1,
          beg: this.pos,
          end: null,
          m: curr.m,
          t: curr.t
        });
      }

      state_pop() {
        var child, curr;
        child = this.state.pop();
        if ((curr = this.state_curr()) != null) {
          curr.beg = child.beg;
          return curr.end = this.pos;
        }
      }

      // This is the dispatch function that calls all the grammar functions.
      // It should be as fast as possible.
      call(func) {
        var args, value;
        if (func instanceof Array) {
          [func, ...args] = func;
        } else {
          args = [];
        }
        this.state_push(func.name);
        args = args.map(function(a) {
          if (typeof a === 'function') {
            return a();
          } else {
            return a;
          }
        });
        value = func.apply(this, args);
        while (typeof value === 'function' || value instanceof Array) {
          value = this.call(value);
        }
        this.state_pop();
        return value;
      }

      // To make the 'call' method as fast as possible, a debugging version of it
      // is here.
      call_debug(func) {
        var args, base, trace, value;
        if (func instanceof Array) {
          [func, ...args] = func;
        } else {
          args = [];
        }
        if (func === Grammar.prototype.block_node) {
          XXX(func);
        }
        (() => {
          if (!isFunction(func)) {
            return FAIL(`Bad call type '${typeof_(func)}' for '${func}'`);
          }
        })();
        this.state_push(func.name);
        trace = func.trace != null ? func.trace : func.trace = func.name;
        if (STATS) {
          if ((base = this.stats.calls)[trace] == null) {
            base[trace] = 0;
          }
          this.stats.calls[trace]++;
        }
        if (TRACE) {
          this.trace_num++;
          this.trace('?', trace, args);
        }
        args = args.map(function(a) {
          if (typeof a === 'function') {
            return a();
          } else {
            return a;
          }
        });
        if (DEBUG && func.name.match(/_\w/)) {
          debug_rule(func.name, ...args);
        }
        value = func.apply(this, args);
        while (typeof value === 'function' || value instanceof Array) {
          value = this.call(value);
        }
        if (TRACE) {
          this.trace_num++;
          if (value) {
            this.trace('+', trace);
          } else {
            this.trace('x', trace);
          }
        }
        this.state_pop();
        return value;
      }

      not(rule, {name} = {}) {
        return this.got(rule, {
          name: name,
          not_: true,
          got_: false
        });
      }

      got(rule, {name, try_, got_, not_} = {}) {
        var got, got_func, not_func, try_func;
        if (name == null) {
          name = ((new Error().stack).match(/at Parser.(\w+?_\w+) \(/))[1];
        }
        if (try_ == null) {
          try_ = false;
        }
        if (not_ == null) {
          not_ = false;
        }
        if (got_ == null) {
          got_ = !not_;
        }
        if (try_) {
          try_func = this.receiver.constructor.prototype[`try_${name}`] || die(`@receiver.try_${name} not defined`);
        }
        if (got_) {
          got_func = this.receiver.constructor.prototype[`got_${name}`] || die(`@receiver.got_${name} not defined`);
        }
        if (not_) {
          not_func = this.receiver.constructor.prototype[`not_${name}`] || die(`@receiver.not_${name} not defined`);
        }
        return got = () => {
          var context, pos, value;
          pos = this.pos;
          context = {
            text: this.input.slice(pos, this.pos),
            state: this.state_curr(),
            start: pos
          };
          if (try_) {
            try_func.call(this.receiver, context);
          }
          value = this.call(rule);
          context.text = this.input.slice(pos, this.pos);
          if (value) {
            if (got_) {
              got_func.call(this.receiver, context);
            }
          } else {
            if (not_) {
              not_func.call(this.receiver, context);
            }
          }
          return value;
        };
      }

      // Match all subrule methods:
      all(...funcs) {
        var all;
        return all = function() {
          var func, j, len1, pos;
          pos = this.pos;
          for (j = 0, len1 = funcs.length; j < len1; j++) {
            func = funcs[j];
            if (func == null) {
              FAIL(`*** Missing function in @all group: ${func}`);
            }
            if (!this.call(func)) {
              this.pos = pos;
              return false;
            }
          }
          return true;
        };
      }

      // Match any subrule method. Rules are tried in order and stops on first
      // match:
      any(...funcs) {
        var any;
        return any = function() {
          var func, j, len1;
          for (j = 0, len1 = funcs.length; j < len1; j++) {
            func = funcs[j];
            if (this.call(func)) {
              return true;
            }
          }
          return false;
        };
      }

      // Repeat a rule a certain number of times:
      rep(quant, func) {
        var max, min, rep;
        switch (quant) {
          case '*':
            [min, max] = [0, 2e308];
            break;
          case '?':
            [min, max] = [0, 1];
            break;
          case '+':
            [min, max] = [1, 2e308];
        }
        rep = function() {
          var count, pos, pos_start;
          count = 0;
          pos = this.pos;
          pos_start = pos;
          while (count < max) {
            if (!this.call(func)) {
              break;
            }
            if (this.pos === pos) {
              break;
            }
            count++;
            pos = this.pos;
          }
          if (count >= min && count <= max) {
            return true;
          }
          this.pos = pos_start;
          return false;
        };
        return name_('rep', rep, `rep(${quant})`);
      }

      // Check for end for doc or stream:
      the_end() {
        return this.pos >= this.end || (this.state_curr().doc && (this.pos === 0 || this.input[this.pos - 1] === "\n") && this.input.slice(this.pos).match(/^(?:---|\.\.\.)(?=\s|$)/));
      }

      // Match a regex:
      rgx(regex, name) {
        var on_end, rgx;
        if (!isRegex(regex)) {
          regex = RegExp(`${regex}`, "u");
        }
        regex = String(regex);
        [regex, on_end] = make(regex);
        rgx = function() {
          var m;
          if (this.the_end()) {
            return on_end;
          }
          regex.lastIndex = this.pos;
          if (m = this.input.match(regex)) {
            this.pos += m[0].length;
            return true;
          }
          return false;
        };
        if (TRACE) {
          if (name == null) {
            name = ((new Error().stack).match(/at Parser.(\w+?_\w+) \(/))[1];
          }
        }
        return name_('rgx', rgx, `rgx('${name}' ${stringify(regex)})`);
      }

      // Match a single char:
      chr(char) {
        var chr;
        chr = function() {
          if (this.the_end()) {
            return false;
          }
          if (this.input[this.pos] === char) {
            this.pos++;
            return true;
          }
          return false;
        };
        return name_('chr', chr, `chr(${stringify(char)})`);
      }

      // Match a char in a range:
      rng(low, high) {
        var rng;
        rng = function() {
          if (this.the_end()) {
            return false;
          }
          if (this.input.slice(this.pos).match(new RegExp(`^[${low}-${high}]`, 'u'))) {
            if (this.input.slice(this.pos).codePointAt(0) > 65535) {
              this.pos++;
            }
            this.pos++;
            return true;
          }
          return false;
        };
        return name_('rng', rng, `rng(${stringify(low)},${stringify(high)})`);
      }

      // Must match first rule but none of others:
      but(...funcs) {
        var but;
        return but = function() {
          var func, j, len1, pos1, pos2, ref;
          if (this.the_end()) {
            return false;
          }
          pos1 = this.pos;
          if (!this.call(funcs[0])) {
            return false;
          }
          pos2 = this.pos;
          this.pos = pos1;
          ref = funcs.slice(1);
          for (j = 0, len1 = ref.length; j < len1; j++) {
            func = ref[j];
            if (this.call(func)) {
              this.pos = pos1;
              return false;
            }
          }
          this.pos = pos2;
          return true;
        };
      }

      chk(type, expr) {
        var chk;
        chk = function() {
          var ok, pos;
          pos = this.pos;
          if (type === '<=') {
            this.pos--;
          }
          ok = this.call(expr);
          this.pos = pos;
          if (type === '!') {
            return !ok;
          } else {
            return ok;
          }
        };
        return name_('chk', chk, `chk(${type}, ${stringify(expr)})`);
      }

      set(var_, expr) {
        var set;
        set = () => {
          var i, size, state, value;
          if (isString(expr)) {
            value = expr;
          } else {
            value = this.call(expr);
          }
          if (value === -1) {
            return false;
          }
          state = this.state_prev();
          state[var_] = value;
          if (state.name !== 'all') {
            size = this.state.length;
            i = 3;
            while (i < size) {
              if (i > size - 1) {
                FAIL("failed to traverse state stack in 'set'");
              }
              state = this.state[size - i++ - 1];
              state[var_] = value;
              if (state.name === 'block_scalar') {
                break;
              }
            }
          }
          return true;
        };
        return name_('set', set, `set('${var_}', ${stringify(expr)})`);
      }

      //   max: (max)->
      //     max = ->
      //       return true
      exclude(rule) {
        var exclude;
        return exclude = function() {
          return true;
        };
      }

      // This method does not need to return a function since it is never
      // called in the grammar.
      match() {
        var beg, end, i, state;
        state = this.state;
        i = state.length - 1;
        while (i > 0 && (state[i].end == null)) {
          if (i === 1) {
            FAIL("Can't find match");
          }
          i--;
        }
        ({beg, end} = state[i]);
        return this.input.slice(beg, end);
      }

      len(str) {
        var len;
        return len = function() {
          if (!isString(str)) {
            str = this.call(str);
          }
          return str.length;
        };
      }

      ord(str) {
        var ord;
        return ord = function() {
          if (!isString(str)) {
            str = this.call(str);
          }
          return str.charCodeAt(0) - 48;
        };
      }

      if(test, do_if_true, do_if_false) {
        var if_;
        if_ = function() {
          if (!isBoolean(test)) {
            test = this.call(test);
          }
          if (test) {
            this.call(do_if_true);
            return true;
          }
          return false;
        };
        return name_('if', if_);
      }

      lt(x, y) {
        var lt;
        lt = function() {
          if (!isNumber(x)) {
            x = this.call(x);
          }
          if (!isNumber(y)) {
            y = this.call(y);
          }
          return x < y;
        };
        return name_('lt', lt, `lt(${stringify(x)},${stringify(y)})`);
      }

      le(x, y) {
        var le;
        le = function() {
          if (!isNumber(x)) {
            x = this.call(x);
          }
          if (!isNumber(y)) {
            y = this.call(y);
          }
          return x <= y;
        };
        return name_('le', le, `le(${stringify(x)},${stringify(y)})`);
      }

      m(n = 0) {
        var m;
        return m = () => {
          return this.state_curr().m + n;
        };
      }

      t() {
        var t;
        return t = () => {
          return this.state_curr().t;
        };
      }

      //------------------------------------------------------------------------------
      // Special grammar rules
      //------------------------------------------------------------------------------
      empty() {
        return true;
      }

      auto_detect_indent(n) {
        var in_seq, m, match, pos, pre;
        pos = this.pos;
        in_seq = pos > 0 && this.input[pos - 1].match(/^[\-\?\:]$/);
        match = this.input.slice(pos).match(/^((?: *(?:\#.*)?\n)*)( *)/ || FAIL("auto_detect_indent"));
        pre = match[1];
        m = match[2].length;
        if (in_seq && !pre.length) {
          if (n === -1) {
            m++;
          }
        } else {
          m -= n;
        }
        if (m < 0) {
          m = 0;
        }
        return m;
      }

      auto_detect(n) {
        var m, match, pre;
        match = this.input.slice(this.pos).match(/^.*\n((?: *\n)*)( *)(.?)/);
        pre = match[1];
        if (match[3].length) {
          m = match[2].length - n;
        } else {
          m = 0;
          while (pre.match(RegExp(` {${m}}`))) {
            m++;
          }
          m = m - n - 1;
        }
        if (m > 0 && pre.match(RegExp(`^.{${m}} `, "m"))) {
          die("Spaces found after indent in auto-detect (5LLU)");
        }
        if (m === 0) {
          return 1;
        } else {
          return m;
        }
      }

      //------------------------------------------------------------------------------
      // Trace debugging
      //------------------------------------------------------------------------------
      trace_start() {
        return '' || ENV.TRACE_START;
      }

      trace_quiet() {
        var noisy, small;
        if (DEBUG) {
          return [];
        }
        small = ['b_as_line_feed', 's_indent', 'non_break_character'];
        noisy = ['document_start_indicator', 'block_folded_scalar', 'block_literal_scalar', 'c_ns_alias_node', 'c_ns_anchor_property', 'c_ns_tag_property', 'directives_and_document', 'document_prefix', 'flow_content', 'ns_plain', 'comment_lines', 'separation_characters'];
        return ((ENV.TRACE_QUIET || '').split(',')).concat(noisy);
      }

      trace(type, call, args = []) {
        var indent, input, l, level, line, prev_level, prev_line, prev_type, trace_info, trace_num;
        if (!isString(call)) { // XXX
          call = String(call);
        }
        if (call.match(/^($| |.* $)/)) {
          call = `'${call}'`;
        }
        if (!(this.trace_on || call === this.trace_start())) {
          return;
        }
        if (call.startsWith('rgx')) {
          call = call.replace(/\n/g, "\\n").replace(/\r/g, "\\r");
        }
        level = this.state_curr().lvl;
        indent = _.repeat(' ', level);
        if (level > 0) {
          l = `${level}`.length;
          indent = `${level}` + indent.slice(l);
        }
        input = this.input.slice(this.pos);
        if (input.length > 30) {
          input = `${input.slice(0, 31)}…`;
        }
        input = input.replace(/\t/g, '\\t').replace(/\r/g, '\\r').replace(/\n/g, '\\n');
        line = sprintf("%s%s %-40s  %4d '%s'", indent, type, this.trace_format_call(call, args), this.pos, input);
        if (DEBUG) {
          warn(sprintf("%6d %s", this.trace_num, line));
          return;
        }
        trace_info = null;
        level = `${level}_${call}`;
        if (type === '?' && this.trace_off === 0) {
          trace_info = [type, level, line, this.trace_num];
        }
        if (indexOf.call(this.trace_quiet(), call) >= 0) {
          this.trace_off += type === '?' ? 1 : -1;
        }
        if (type !== '?' && this.trace_off === 0) {
          trace_info = [type, level, line, this.trace_num];
        }
        if (trace_info != null) {
          [prev_type, prev_level, prev_line, trace_num] = this.trace_info;
          if (prev_type === '?' && prev_level === level) {
            trace_info[1] = '';
            if (line.match(/^\d*\ *\+/)) {
              prev_line = prev_line.replace(/\?/, '=');
            } else {
              prev_line = prev_line.replace(/\?/, '!');
            }
          }
          if (prev_level) {
            warn(sprintf("%5d %6d %s", ++this.trace_line, trace_num, prev_line));
          }
          this.trace_info = trace_info;
        }
        if (call === this.trace_start()) {
          return this.trace_on = !this.trace_on;
        }
      }

      trace_format_call(call, args) {
        var list;
        if (!args.length) {
          return call;
        }
        list = args.map(function(a) {
          return stringify(a);
        });
        list = list.join(',');
        return `${call}(${list})`;
      }

      trace_flush() {
        var count, level, line, type;
        [type, level, line, count] = this.trace_info;
        if (line) {
          return warn(sprintf("%5d %6d %s", ++this.trace_line, count, line));
        }
      }

    };

    Parser.prototype.stats = {
      calls: {}
    };

    make = memoize(function(regex) {
      var on_end;
      on_end = !!regex.match(/\)[\?\*]\/[muy]*$/);
      if (regex.match(/y$/)) {
        die_(regex);
      }
      if (regex.endsWith('u')) {
        regex = regex.slice(0, -1);
      }
      regex = regex.replace(/\(([:!=]|<=)/g, '(?$1');
      regex = String(regex).slice(1, -1).replace(/\((?!\?)/g, '(?:');
      regex = RegExp(`(?:${regex})`, "yum");
      return [regex, on_end];
    });

    return Parser;

  }).call(this);

  // vim: sw=2:

}).call(this);
