local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require('luasnip.extras').lambda
local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.conditions'
local conds_expand = require 'luasnip.extras.conditions.expand'

local function copy(args)
  return args[1]
end

ls.add_snippets('all', {
  -- trigger is `fn`, second argument to snippet-constructor are the nodes to insert into the buffer on expansion.
  s('#ifndef', {
    -- Simple static text.
    t '#ifndef ',
    -- function, first parameter is the function, second the Placeholders
    -- whose text it gets as input.
    i(1, 'FILE_H'),
    t { '', '#define ' },
    f(copy, 1),
    t { '', '' },
    -- Placeholder/Insert.
    -- Placeholder with initial text.
    i(0),
    t { '', '#endif //' },
    f(copy, 1),
    t { '', '' },
  }),

  s('typedef', {
    t 'typedef ',
    c(1, {
      sn(nil, {
        t 'struct',
        t { '', '{' },
        t { '', '\t' },
        i(2), -- struct body
        t { '', '} ' },
        i(1), -- struct name
        t ';',
      }),
      sn(nil, {
        t 'enum ',
        i(1), -- enum name
        t { '', '{' },
        t { '', '\t' },
        i(2), -- enum body
        t { '', '} ' },
        rep(1), -- repeat enum name
        t ';',
      }),
    }),
  }),
})

return {}
