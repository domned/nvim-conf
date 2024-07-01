local lsp = require('lsp-zero')

lsp.preset('recomended')
lsp.setup()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select), 
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select), 
	['<C-y>'] = cmp.mapping.confirm({select = true}), 
	['<C-Space>'] = cmp.mapping.complete(),
})

local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }),
})
lsp.set_preferences({
	sign_icons = { }
})
require('mason').setup({})


require('mason-lspconfig').setup({
  ensure_installed = {"pyright"},
  handlers = {
    --- this first function is the "default handler"
    --- it applies to every language server without a "custom handler"
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    --- this is the "custom handler" for `example_server`
    --- in your own config you should replace `example_server`
    --- with the name of a language server you have installed
      --- in this function you can setup
      --- the language server however you want. 
      --- in this example we just use lspconfig

        ---
        -- in here you can add your own
        -- custom configuration
        --
  },
})
