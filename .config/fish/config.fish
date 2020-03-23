# Fish Shell config file ><>
# author: Beniamin Dudek <beniamin.dudek@yahoo.com>

# fisher bootstrap
# if not functions -q fisher
#     set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#     curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#     fish -c fisher
# end

# neovim aliases
alias v "nvim -u ~/.config/nvim/clean.vim"
alias e v
alias vi nvim
alias vim nvim

# path
# set -Ua fish_user_paths $HOME/.local/bin

# go
# set GOPATH $HOME/go
# set GOROOT /usr/loca/go
# set -Ua fish_user_paths $GOROOT/bin
# set -Ua fish_user_paths $GOPATH/bin

# npm
# set -Ua fish_user_paths $HOME/.local/node_modules/bin

# rust
# set -Ua fish_user_paths $HOME/.cargo/bin

# cabal
# set -Ua fish_user_paths $HOME/.cabal/bin

# pyenv
# set -x PYENV_ROOT $HOME/.pyenv
# set -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

# fzf
# set -Ua fish_user_paths $HOME/.fzf/bin
