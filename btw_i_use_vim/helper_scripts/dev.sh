#!/bin/bash

SESSION="dev"
START_DIR=$(realpath "${1:-.}")

if tmux has-session -t $SESSION 2>/dev/null; then
    echo "Tmux session '$SESSION' already exists"
else
    tmux new-session -s $SESSION -d -c "$START_DIR" "bash"
    tmux split-window -v -t $SESSION:0 -c "$START_DIR" "bash"
    tmux resize-pane -t $SESSION:0.0 -y 75%
    tmux select-pane -t $SESSION:0.0
    sleep 0.2
    CMD=" \
        sleep 0.1; \
        tmux send-keys -t $SESSION:0.0 vim C-m; \
        tmux set-hook -u $SESSION client-attached \ 
    "
    tmux set-hook -t $SESSION client-attached "run-shell '$CMD'"
    tmux attach -t $SESSION
fi
