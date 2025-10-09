ff() {
  # 1. Search for text in files using Ripgrep
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    # 2. Interactively narrow down the list using fzf
    fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --border \
      --tmux=80% \
      --delimiter : \
      --preview "bat --number --color=always {1} --highlight-line {2}" \
      --header-first \
      --header="Refine search and press enter to open file (press ctrl-c to exit)" \
      --preview-window "up,60%,border-bottom,+{2}+3/3,~3" \
      --bind "enter:become(nvim {1} +{2})" # 3. Open the file in nvim
}

fd() {
  export FZF_DEFAULT_OPTS=" \
  --multi \
  --layout=reverse \
  --border \
  --preview='lsd --tree {} --depth 2 --ignore-glob node_modules' \
  --margin=1 \
  --no-scrollbar \
  --ansi \
  --header='Choose a folder to open in a new tmux session' \
  --header-first \
  --preview-label='File Preview' \
  --preview-window='right:30%:wrap' \
  --tmux=80%"

  if [[ $# -eq 1 ]]; then
    selected=$1
  else 
    selected=$(find ~/ ~/Projects ~/Projects/* ~/.config ~/.local -mindepth 1 -maxdepth 1 -type d | fzf)
  fi

  if [[ -z $selected ]]; then
        exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
  fi

  if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  tmux switch-client -t $selected_name

}
