# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew gem nanoc npm tmux tmuxinator vagrant)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export PATH="$PATH:./node_modules/.bin"

source $ZSH/oh-my-zsh.sh

PERL_MB_OPT="--install_base \"/Users/jcaudle/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jcaudle/perl5"; export PERL_MM_OPT;

 . `brew --prefix`/etc/profile.d/z.sh

export NVM_DIR="/Users/jcaudle/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(hub alias -s)"

alias zcon="vim ~/.zshrc"
alias omz="vim ~/.oh-my-zsh"
alias vcon="vim ~/.vimrc"
alias tcon="vim ~/.tmux.conf"
alias reload="source ~/.zshrc"
alias modified="git status --porcelain | grep '^.[^D]' | cut -c 3-"
alias gcb="git checkout -b"
alias gap="git add -p"
alias pwdserve="ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 9393, :DocumentRoot => Dir.pwd).start'"
alias dvim="vim +'set background=dark'"
alias lvim="vim +'set background=light'"
alias pfx="sudo chown -R $(whoami):admin /usr/local"

export GOPATH="$HOME/code/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

export PATH="$PATH:./bin"

export DOTFILES_PATH="$HOME/.dotfiles"

export HOMEBREW_GITHUB_API_TOKEN="df0e09345860fe117d3470ae71257c114aedecbf"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.2
