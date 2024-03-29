cat <<EOT >> ~/.tmux.conf
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

set -g mouse on

setw -g aggressive-resize on
set-option -sg escape-time 10

set-option -g base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

set -ga terminal-overrides ',*:Tc'
set -g default-terminal "screen-256color"
set -g history-limit 50000
set -g pane-border-status bottom

unbind C-b
set -g prefix C-Space
bind Space send-prefix

set-option -g status-position top
set-option -g status-interval 5
set-option -g status-bg default
set-option -g status-fg white
set-option -g status-left-length 40
set-option -g status-left "#[fg=brightwhite,bg=brightblack] #S #[fg=default,bg=default] "
set-optio -g window-status-format "#[fg=white,bg=brightblack] #I #[fg=white,bg=black] #W "
set-option -g window-status-current-format "#[fg=brightwhite,bg=green] #I #[fg=brightwhite,bg=blue] #W "
set-option -g window-status-separator " "
set-option -g status-justify left
set-option -g status-right-length 150
EOT
