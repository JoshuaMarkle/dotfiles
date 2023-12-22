Vim�UnDo� \�pN��\m�=!(s��[¼�>�	� ����   4                  	       	   	   	    e�9�    _�                             ����                                                                                                                                                                                                                                                                                                                                       1           V        e�9l     �               �               �             0   "  'nvim-telescope/telescope.nvim',   	branch = '0.1.x',   	dependencies = {       'nvim-lua/plenary.nvim',       {   1      'nvim-telescope/telescope-fzf-native.nvim',         build = 'make',         cond = function()   ,        return vim.fn.executable 'make' == 1   
      end,       },     },     config = function ()        require('telescope').setup {         defaults = {           mappings = {             i = {               ['<C-u>'] = false,               ['<C-d>'] = false,             }   	        }         }       }       0    -- Enable telescope fzf native, if installed   5    pcall(require('telescope').load_extension, 'fzf')          $    -- See `:help telescope.builtin`   q    vim.keymap.set('n', 'ff', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })   x    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })   /    vim.keymap.set('n', '<leader>/', function()   W    -- You can pass additional configuration to telescope to change theme, layout, etc.   e    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {         winblend = 10,         previewer = false,       })   ;    end, { desc = '[/] Fuzzily search in current buffer' })       p    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })   m    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })   k    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })   u    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })   n    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })   t    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })   k    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })         end,   }5��           0               	       �              �                   6       	               G      5�_�                            ����                                                                                                                                                                                                                                                                                                                                       7           V        e�9n     �                 return {5��                                   	               5�_�                            ����                                                                                                                                                                                                                                                                                                                                       6           V        e�9s     �                 return {5��                                   	               5�_�                           ����                                                                                                                                                                                                                                                                                                                                       5           V        e�9|     �          5        {5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                      3          V       e�9�     �      4   5   2   $    "nvim-telescope/telescope.nvim",       cmd = "Telescope",       lazy = true,       keys = {   M      { "ff", "<cmd>Telescope find_files<CR>", desc = "Find Files Fuzzily" },   C      { "fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },   D      { "fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },   O      { "fo", "<cmd>Telescope colorscheme<CR>", desc = "Choose Colorschemes" },   Q      { "fe", "<cmd>Telescope emoji<CR>", desc = "Emoji search - copy - paste" },   ]      { "fd", "<cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics [Telescope]" },       },       dependencies = {   Q      { "xiyaowong/telescope-emoji.nvim", lazy = true, cmd = "Telescope emoji" },   E      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },       },       config = function()   H      local telescope_status_ok, telescope = pcall(require, "telescope")   %      if not telescope_status_ok then   %        print("Telescope not found!")   	      end   E      local icons_ok, icons = pcall(require, "NeutronVim.core.icons")         if not icons_ok then   (        print("Unable to import icons!")   	      end         telescope.setup({           defaults = {   4          entry_prefix = icons.ui.ArrowDownandRight,   *          selection_caret = icons.ui.Plug,   -          prompt_prefix = icons.ui.Telescope,   "          initial_mode = "insert",   '          selection_strategy = "reset",   )          sorting_strategy = "ascending",   )          layout_strategy = "horizontal",             layout_config = {               horizontal = {   &              prompt_position = "top",   #              preview_width = 0.55,   "              results_width = 0.5,               },               vertical = {                 mirror = false,               },               width = 0.87,               height = 0.8,   !            preview_cutoff = 120,             },   
        },         })   '      telescope.load_extension("emoji")       end,5��                         	                     �                         ,                     �                         A                     �                         P                     �                         [                     �                         �                     �                         �                     �                         ,                    �    	                     z                    �    
                     �                    �                         &                    �                         +                    �                         >                    �                         �                    �                         �                    �                         �                    �                         �                    �                         4                    �                         X                    �                         |                    �                         �                    �                         �                    �                         �                    �                                             �                                             �                         &                    �               
          9      
              �               
          l      
              �               
          �      
              �               
          �      
              �               
          �      
              �                
                
              �    !           
          0      
              �    "           
          X      
              �    #                  
   r             
       �    $                     �                    �    %                     �                    �    &                     �                    �    '                  
   �             
       �    (                  
                 
       �    )                                         �    *                  
   3             
       �    +                  
   @             
       �    ,                  
   X             
       �    -                  
   p             
       �    .           
          �      
              �    /                     �                    �    0                     �                    �    1                     �                    �    2                     �                    5�_�      	              4        ����                                                                                                                                                                                                                                                                                                                                      3          V       e�9�     �   3   4            },5��    3                      �                     5�_�                  	   4        ����                                                                                                                                                                                                                                                                                                                                      3          V       e�9�    �      4   4   2   "  "nvim-telescope/telescope.nvim",     cmd = "Telescope",     lazy = true,   
  keys = {   K    { "ff", "<cmd>Telescope find_files<CR>", desc = "Find Files Fuzzily" },   A    { "fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },   B    { "fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },   M    { "fo", "<cmd>Telescope colorscheme<CR>", desc = "Choose Colorschemes" },   O    { "fe", "<cmd>Telescope emoji<CR>", desc = "Emoji search - copy - paste" },   [    { "fd", "<cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics [Telescope]" },     },     dependencies = {   O    { "xiyaowong/telescope-emoji.nvim", lazy = true, cmd = "Telescope emoji" },   C    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },     },     config = function()   F    local telescope_status_ok, telescope = pcall(require, "telescope")   #    if not telescope_status_ok then   #      print("Telescope not found!")       end   C    local icons_ok, icons = pcall(require, "NeutronVim.core.icons")       if not icons_ok then   &      print("Unable to import icons!")       end       telescope.setup({         defaults = {   2        entry_prefix = icons.ui.ArrowDownandRight,   (        selection_caret = icons.ui.Plug,   +        prompt_prefix = icons.ui.Telescope,            initial_mode = "insert",   %        selection_strategy = "reset",   '        sorting_strategy = "ascending",   '        layout_strategy = "horizontal",           layout_config = {             horizontal = {   $            prompt_position = "top",   !            preview_width = 0.55,                results_width = 0.5,             },             vertical = {               mirror = false,             },             width = 0.87,             height = 0.8,             preview_cutoff = 120,   
        },         },       })   %    telescope.load_extension("emoji")     end,5��           1      1      	       �      0      5�_�                           ����                                                                                                                                                                                                                                                                                                                                       5           V        e�9y     �       6       5   {   "  "nvim-telescope/telescope.nvim",     cmd = "Telescope",     lazy = true,   
  keys = {   K    { "ff", "<cmd>Telescope find_files<CR>", desc = "Find Files Fuzzily" },   A    { "fg", "<cmd>Telescope live_grep<CR>", desc = "Find Text" },   B    { "fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },   M    { "fo", "<cmd>Telescope colorscheme<CR>", desc = "Choose Colorschemes" },   O    { "fe", "<cmd>Telescope emoji<CR>", desc = "Emoji search - copy - paste" },   [    { "fd", "<cmd>Telescope diagnostics<CR>", desc = "Workspace Diagnostics [Telescope]" },     },     dependencies = {   O    { "xiyaowong/telescope-emoji.nvim", lazy = true, cmd = "Telescope emoji" },   C    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },     },     config = function()   F    local telescope_status_ok, telescope = pcall(require, "telescope")   #    if not telescope_status_ok then   #      print("Telescope not found!")       end   C    local icons_ok, icons = pcall(require, "NeutronVim.core.icons")       if not icons_ok then   &      print("Unable to import icons!")       end       telescope.setup({         defaults = {   2        entry_prefix = icons.ui.ArrowDownandRight,   (        selection_caret = icons.ui.Plug,   +        prompt_prefix = icons.ui.Telescope,            initial_mode = "insert",   %        selection_strategy = "reset",   '        sorting_strategy = "ascending",   '        layout_strategy = "horizontal",           layout_config = {             horizontal = {   $            prompt_position = "top",   !            preview_width = 0.55,                results_width = 0.5,             },             vertical = {               mirror = false,             },             width = 0.87,             height = 0.8,             preview_cutoff = 120,   
        },         },       })   %    telescope.load_extension("emoji")     end,   },   }5��                                                  �                                              �                         %                     �                         :                     �                         I                     �                         T                     �                         �                     �                         �                     �                         %                    �    	                     s                    �    
                     �                    �                                             �                         $                    �                         7                    �                         �                    �                         �                    �                         �                    �                         �                    �                         -                    �                         Q                    �                         u                    �                         }                    �                         �                    �                         �                    �                                             �                         	                    �                                             �               
          2      
              �               
          e      
              �               
          �      
              �               
          �      
              �               
          �      
              �                
                
              �    !           
          )      
              �    "           
          Q      
              �    #                  
   k             
       �    $                     �                    �    %                     �                    �    &                     �                    �    '                  
   �             
       �    (                  
   �             
       �    )                                         �    *                  
   ,             
       �    +                  
   9             
       �    ,                  
   Q             
       �    -                  
   i             
       �    .           
          �      
              �    /                     �                    �    0                     �                    �    1                     �                    �    2                     �                    �    3                      �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        e�9u     �       6           5��            5                      >             5��