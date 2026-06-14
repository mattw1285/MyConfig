#!/bin/bash

SESSION="dev"

if tmux has-session -t $SESSION 2>/dev/null; then
    echo "Tmux session '$SESSION' already exists"
else
    tmux new-session -s $SESSION -d "vim"
    tmux split-window -v -t $SESSION:0
    tmux resize-pane -t $SESSION:0.0 -y 75%
    tmux send-keys -t $SESSION:0.0 "vim" C-m
    tmux select-pane -t $SESSION:0.0
    tmux attach -t $SESSION
fi
