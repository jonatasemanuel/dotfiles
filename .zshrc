# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin" 
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH:/var/lib/flatpak/exports/bin"

export TERMINAL="alacritty"
export BROWSER="/usr/bin/zen"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="theunraveler"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="gozilla"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# alias emacs="emacsclient -c -a 'emacs'"
alias dotfiles='git --git-dir=$HOME/.gitconfigs/dotfiles.git --work-tree=$HOME'
alias v="nvim"

[[ -f ~/.config/zsh/tmux.zsh ]] && source ~/.config/zsh/tmux.zsh
[[  -f ~/.config/zsh/functions.zsh ]] && source ~/.config/zsh/functions.zsh


# CHANGE TO SCRIPT FILES
 
# Run 'fff' with 'f' or whatever you decide to name the function.
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
# Show/Hide hidden files on open.
# (Off by default)
export FFF_HIDDEN=1

# Show/Hide file icons on open
# (Off by default)
export FFF_FILE_ICON=1

# Show/Hide git status signs (+) on open
# (Off by default)
export FFF_GIT_CHANGES=1

# Default method to sort files on open
# 0 - alphabetically
# 1 - modification time
# (0 by default)
export FFF_SORT_METHOD=1

# Show/Hide file details on open
# (Off by default)
export FFF_FILE_DETAILS=1

# Use LS_COLORS to color fff.
# (On by default if available)
# (Ignores FFF_COL1)
export FFF_LS_COLORS=1

# Directory color [0-9]
export FFF_COL1=2

# Status background color [0-9]
export FFF_COL2=7

# Selection color [0-9] (copied/moved files)
export FFF_COL3=6

# Cursor color [0-9]
export FFF_COL4=1

# Status foreground color [0-9]
export FFF_COL5=0

# Selection color
# (inverted foreground by default)
# ('48;2;R;G;B' values separated by ';', don't edit the '48;2;' part!).
# In terminals that support truecolor, this will set the selection color
# to grey, but on others selection will be only white bold text (if this
# is set).
export FFF_COL6="48;2;80;80;80"

# Text Editor
export EDITOR="nvim"

# File Opener
export FFF_OPENER="xdg-open"

# File Attributes Command
export FFF_STAT_CMD="stat"

# Enable or disable CD on exit.
# (On by default)
export FFF_CD_ON_EXIT=0

# CD on exit helper file
# Default: '${XDG_CACHE_HOME}/fff/fff.d'
#          If not using XDG, '${HOME}/.cache/fff/fff.d' is used.
export FFF_CD_FILE=~/.fff_d

# Config File
# Default: '${XDG_CONFIG_HOME/fff}'
#          If not using XDG, '${HOME}/.config/fff' is used.
export FFF_CONFIG=~/.config/fff

# Trash Directory
# Default: '${XDG_DATA_HOME}/fff/trash'
#          If not using XDG, '${HOME}/.local/share/fff/trash' is used.
export FFF_TRASH=~/.local/share/fff/trash

# Trash Command
# Default: 'mv'
#          Define a custom program to use to trash files.
#          The program will be passed the list of selected files
#          and directories.
export FFF_TRASH_CMD="mv"

# Favourites (Bookmarks) (keys 1-9) (dir or file)
export FFF_FAV1=~/projects
export FFF_FAV2=~/.bashrc
export FFF_FAV3=~/Pictures/Wallpapers/
export FFF_FAV4=/usr/share
export FFF_FAV5=/
export FFF_FAV6=
export FFF_FAV7=
export FFF_FAV8=
export FFF_FAV9=

# History file length.
# (100 lines by default)
# Every cd-on-exit (q) program deletes every line older than
# FFF_HISTORY_LENGTH.
# Example: history has 150 lines, quitting trims history file
# to 100 most recent.
export FFF_HISTORY_LENGTH=200

# File format.
# Customize the item string.
# Format ('%f' is the current file): "str%fstr"
# Example (Add a tab before files): FFF_FILE_FORMAT="\t%f"
export FFF_FILE_FORMAT="%f"

# Mark format.
# Customize the marked item string.
# Format ('%f' is the current file): "str%fstr"
# Example (Add a ' >' before files): FFF_MARK_FORMAT="> %f"
export FFF_MARK_FORMAT=" %f*"

# Clipboard program and arguments.
# Default: xclip -selection c 
export FFF_KEY_CLIPBOARD="xclip -selection c"

# Scroll steps.
# (14 by default).
export FFF_SCROLL_UP=14
export FFF_SCROLL_DOWN=14

# Sixel image program.
# Default: img2sixel
export FFF_SIXEL_CMD="img2sixel"

source <(fzf --zsh)
bindkey '^R' fzf-history-widget

