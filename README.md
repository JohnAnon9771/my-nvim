# ⚡ My Neovim Config

Uma configuração personalizada do Neovim, construída sobre a arquitetura do [Lazy.nvim](https://github.com/folke/lazy.nvim), focada em performance, desenvolvimento **Ruby** e **Lua**, e ergonomia.

![Lua](https://img.shields.io/badge/Lua-blue.svg?style=for-the-badge&logo=lua)
![Neovim](https://img.shields.io/badge/Neovim%200.9+-green.svg?style=for-the-badge&logo=neovim)
![Ruby](https://img.shields.io/badge/Ruby-CC342D.svg?style=for-the-badge&logo=ruby)

## ✨ Funcionalidades

Esta configuração mistura a modularidade do LazyVim com escolhas pessoais de performance:

- **Gestor de Plugins**: `lazy.nvim` para carregamento rápido.
- **Autocompletion Rápido**: Utiliza [coq_nvim](https://github.com/ms-jpq/coq_nvim) em vez do cmp tradicional, para uma experiência super veloz.
- **Ruby & Rails Power**:
  - Configuração personalizada do `ruby-lsp` para gestão de dependências.
  - Testes integrados com `neotest` + `neotest-rspec`.
  - Formatação automática com `rubocop` via `conform.nvim`.
- **Navegação Ágil**:
  - [Harpoon 2](https://github.com/ThePrimeagen/harpoon) para alternar entre contextos.
  - `Telescope` com `fzf-native` para buscas instantâneas.
  - `Neo-tree` para gestão de ficheiros.
- **Git**: Integração completa com `Neogit`, `Gitsigns` e `Diffview`.
- **Visual**: Tema `Gruvbox` com suporte a transparência.

## 🛠️ Instalação

Certifique-se de ter o **Neovim >= 0.9** instalado, assim como dependências para o Treesitter (compilador C) e para os LSPs (Node.js, Ruby, etc).

1.  Faça o backup da sua configuração antiga:

    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  Clone este repositório:

    ```bash
    git clone [https://github.com/JohnAnon9771/my-nvim.git](https://github.com/JohnAnon9771/my-nvim.git) ~/.config/nvim
    ```

3.  Inicie o Neovim:
    ```bash
    nvim
    ```
    _O `lazy.nvim` irá instalar todos os plugins automaticamente na primeira execução._

## ⌨️ Keymaps Principais

A tecla líder (<kbd>Leader</kbd>) está configurada como <kbd>Space</kbd>.

### 🧭 Navegação & Edição

| Tecla                                        | Ação                                        |
| :------------------------------------------- | :------------------------------------------ |
| <kbd>jj</kbd>                                | Sai do modo Insert (Escape melhorado)       |
| <kbd>Leader</kbd> + <kbd>e</kbd>             | Alternar explorador de ficheiros (Neo-tree) |
| <kbd>Leader</kbd> + <kbd>h</kbd>             | Ir para o início da linha (textual)         |
| <kbd>Leader</kbd> + <kbd>l</kbd>             | Ir para o final da linha                    |
| <kbd>Alt</kbd> + <kbd>j</kbd> / <kbd>k</kbd> | Mover linha atual para baixo/cima           |

### 🎣 Harpoon

| Tecla                               | Ação                                       |
| :---------------------------------- | :----------------------------------------- |
| <kbd>Leader</kbd> + <kbd>a</kbd>    | Adicionar ficheiro ao Harpoon              |
| <kbd>Leader</kbd> + <kbd>qm</kbd>   | Menu rápido do Harpoon                     |
| <kbd>Leader</kbd> + <kbd>1..4</kbd> | Ir para o ficheiro 1 a 4                   |
| <kbd>Tab</kbd> / <kbd>S-Tab</kbd>   | Navegar próximo/anterior buffer do Harpoon |

### 🔍 Telescope & Git

| Tecla                                | Ação                                           |
| :----------------------------------- | :--------------------------------------------- |
| <kbd>Leader</kbd> + <kbd>ff</kbd>    | Procurar ficheiros                             |
| <kbd>Leader</kbd> + <kbd>fg</kbd>    | Live Grep (procurar texto)                     |
| <kbd>Leader</kbd> + <kbd>gh...</kbd> | Ações do Gitsigns (Stage, Reset, Preview Hunk) |

## 🧩 Plugins Principais

- **UI/UX**: `nui.nvim`, `notify` (via `snacks.nvim`), `dressing.nvim`.
- **LSP/Format**: `nvim-lspconfig`, `mason.nvim`, `conform.nvim`.
- **Treesitter**: Highlight avançado para Ruby, Lua, HTML, etc.

## 📂 Estrutura

```text
📂 lua
 ┣ 📂 config
 ┃ ┣ 📜 autocmds.lua  <- Autocomandos
 ┃ ┣ 📜 keymaps.lua   <- Atalhos globais
 ┃ ┣ 📜 lazy.lua      <- Bootstrap do gestor de plugins
 ┃ ┗ 📜 options.lua   <- Opções do Vim (números, tabs, etc)
 ┣ 📂 plugins         <- Todos os plugins (LSP, Colorscheme, etc)
 ┃ ┣ 📜 coq.lua       <- Config do Autocomplete
 ┃ ┣ 📜 ...
 ┣ 📂 util            <- Utilitários (ex: ruby-lsp helpers)
 ┗ 📜 init.lua        <- Ponto de entrada
```
