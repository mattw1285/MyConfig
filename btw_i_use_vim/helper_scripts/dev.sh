#!/bin/bash

SESSION="dev"

if tmux has-session -t $SESSION 2>/dev/null; then
    echo "Tmux session '$SESSION' already exists"
else
    tmux new-session -s $SESSION -d
    tmux split-window -v -t $SESSION:0
    tmux resize-pane -t $SESSION:0.0 -y 75%
    sleep 0.1
    tmux send-keys -t $SESSION:0.0 "vim" C-m
    sleep 0.1
    tmux select-pane -t $SESSION:0.1
    tmux attach -t $SESSION
fi
