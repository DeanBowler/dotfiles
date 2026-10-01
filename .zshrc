eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

## Install Znap plugins
znap source marlonrichert/zsh-autocomplete

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# git aliases
alias g="git"
alias gs="git st"
alias gsw="git switch"

# pnpm Aliases

alias p='pnpm'

## Dependencies
alias pa='pnpm add'
alias pad='pnpm add --save-dev'
alias pap='pnpm add --save-peer'
alias prm='pnpm remove'
alias pin='pnpm install'
alias pls='pnpm list'
alias pu='pnpm update'
alias puil='pnpm update --interactive --latest'

## Global dependencies
alias pga='pnpm add --global'
alias pgls='pnpm list --global'
alias pgrm='pnpm remove --global'
alias pgu='pnpm update --global'

## WorkSpace
alias pwa='pnpm add --workspace'
alias pwls='pnpm list --workspace'
alias pwrm='pnpm remove --workspace'
alias pwu='pnpm update --workspace'

## Run scripts
alias prun='pnpm run'
alias pd='pnpm run dev'
alias pb='pnpm run build'
alias psv='pnpm run serve'
alias pst='pnpm start'
alias pt='pnpm test'
alias ptc='pnpm test --coverage'
alias pln='pnpm run lint'
alias pdocs='pnpm run docs'
alias pex='pnpm exec'
alias pdx='pnpm dlx'

## Misc
alias pi='pnpm init'
alias ppub='pnpm publish'
alias pc='pnpm create'

## Monorepo
alias pf='pnpm -r --filter'

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
