# about fzf-tab of plugins
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# fzf-tab will try to complete unambiguous prefix without user confirmation.
zstyle ':completion:*' menu no
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# preview directory's content with eza when completing
zstyle ':fzf-tab:complete:(cd|eza|bat):*' fzf-preview 'eza -1 --color=always $realpath'

# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
# If you're using tmux >=-2, we provide a script ftb-tmux-popup to make full use of it's "popup" feature.
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# The right and bottom padding of the popup window. It is exclusively useful for modifying the tmux popup window's padding.
zstyle ':fzf-tab:complete:*:*' popup-pad 30 0

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
  fzf-preview 'echo ${(P)word}'


# git. it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
  'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
  'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
  'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
  'case "$group" in
  "[commit tag]") git show --color=always $word ;;
  *) git show --color=always $word | delta ;;
  esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
  'case "$group" in
  "[modified file]") git diff $word | delta ;;
  "[recent commit object name]") git show --color=always $word | delta ;;
  *) git log --color=always $word ;;
  esac'
zstyle ':fzf-tab:complete:git-switch:*' fzf-preview \
  'case "$group" in
  "[branch name]") git log --color=always $word ;;
  "[remote branch name]") git log --color=always origin/$word ;;
  *) git log --color=always $word ;;
  esac'