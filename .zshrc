# Fix Interop Error that randomly occurs in vscode terminal when using WSL2
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

# Load Antigen zsh
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle sudo

# Syntax non-core bundle
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Command auto-correction.
ENABLE_CORRECTION="true"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Colormap
function colormap() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# find out which distribution we are running
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')

# set an icon based on the distro
# make sure your font is compatible with https://github.com/lukas-w/font-logos
case $_distro in
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac

export STARSHIP_DISTRO="$ICON "
export STARSHIP_DEVICE="$DEVICE "

# SHORTCUTS

# ALIAS GIT

alias ga='git add'
alias gpf='git push --force-with-lease'
alias go='git checkout'

# ALIAS COMMANDS
alias Ac='sudo apt autoclean'
alias Ag='sudo apt install'
alias Ai='apt show'
alias Ar='sudo apt remove'
alias Arm='sudo apt autoremove'
alias Arp='sudo apt remove --purge'
alias As='apt search'
alias rrf="rm -rf"
alias ls="exa --icons --group-directories-first"
alias ll="exa --icons --group-directories-first -l"
alias work="cd /home/beto/Development"
alias mango="cd /home/beto/Development/mango"
alias port="cd /home/beto/Development/Portfolio"
alias drun="sudo service docker start"
alias sdoc="sudo service docker stop"

# PNPM ALIASES
alias pni='pnpm install'
alias pnid='pnpm install --save-dev'
alias pnig='pnpm install -g'
alias pnu='pnpm update --latest'
alias pnug='pnpm update -g'
alias pnp='pnpm prune'
alias pnrm='pnpm rm'
alias pns='pnpm search'

# PNPM SCRIPTS ALIASES
alias dev='pnpm dev'
alias build='pnpm build'
alias start='pnpm start'
alias check='npm run check'
alias watch='npm run test:watch'
alias format='npm run format'
alias typecheck='npm run typecheck'
alias validate='npm run validate'
alias lint='pnpm lint'
alias slint='pnpm lint:styles'

# TESTS ALIASES
alias t='pnpm test'
alias tc='pnpm test:ci'
alias tw='pnpm test:watch'

alias coverage='xdg-open coverage/lcov-report/index.html'
alias reinstall='rm -rf node_modules pnpm-lock.yaml && pnpm i'
alias reload='source ~/.zshrc'
alias mclear='echo 1 | sudo tee /proc/sys/vm/drop_caches'

# plugins
plugins=(git ssh-agent zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

# Keep 100000000 lines of history
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=100000000
SAVEHIST=100000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

eval "$(starship init zsh)"
