#!/bin/bash

SESSION="grid_env"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION -n "work"

    tmux split-window -h -t $SESSION:0

    tmux split-window -v -t $SESSION:0.1

    tmux resize-pane -t $SESSION:0.1 -x 75%
    
    tmux resize-pane -t $SESSION:0.2 -y 25%

    tmux send-keys -t $SESSION:0.0 "cd ~/projects && ls" C-m
    tmux send-keys -t $SESSION:0.1 "vim" C-m
    tmux send-keys -t $SESSION:0.2 "python3" C-m

    tmux select-pane -t $SESSION:0.1
fi

tmux attach-session -t $SESSION


