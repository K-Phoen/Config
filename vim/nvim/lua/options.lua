vim.opt.ignorecase = true     -- ignore case in search patterns
vim.opt.smartcase = true      -- smart case
vim.opt.smartindent = true    -- insert indents automatically
vim.opt.autoindent = true     -- indent a new line the same amount as the line just typed
vim.opt.swapfile = false      -- don't create swapfiles
vim.opt.number = true         -- set numbered lines
vim.opt.undofile = true       -- enable persistent undo
vim.opt.signcolumn = "yes"    -- always show the sign column to avoid jumps when it appears/disappears
vim.opt.tabstop = 4           -- number of columns occupied by a tab 
vim.opt.cursorline = true     -- highlight the cursor line
vim.opt.mouse = ""            -- disable mouse
vim.opt.cc = "80,120"         -- display rulers
vim.opt.sidescrolloff = 8     -- Columns of context when scrolling
vim.opt.scrolloff = 4         -- Lines of context when scrolling
vim.opt.conceallevel = 2      -- Hide * markup for bold and italic, but not markers with substitutions

-- Enable inline diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- fuzzy: enable fuzzy-matching for completion candidates
vim.o.completeopt = "menuone,noinsert,noselect"
