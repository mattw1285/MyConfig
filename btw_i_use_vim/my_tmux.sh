#!/bin/bash

SESSION="grid_env"

tmux has-session -t $SESSION 2>/dev/null

if [ $? != 0 ]; then
    # 1. Create session with the first window (the left terminal)
    tmux new-session -d -s $SESSION -n "work"

    # 2. Split vertically for Vim on the right (50/50 initial)
    tmux split-window -h -t $SESSION:0

    # 3. Create the bottom terminal by splitting the current pane (full width)
    # This splits the pane you are currently in (the Vim one)
    tmux split-window -v -t $SESSION:0.1

    # 4. Resize panes
    # Resize right pane (Vim) to take up 2/3 of the width
    tmux resize-pane -t $SESSION:0.1 -x 75%
    
    # Resize bottom pane (Python) to take up 1/4 of the height (leaving 3/4 for top)
    tmux resize-pane -t $SESSION:0.2 -y 25%

    # 5. Send commands
    tmux send-keys -t $SESSION:0.0 "cd ~/projects && ls" C-m
    tmux send-keys -t $SESSION:0.1 "vim" C-m
    tmux send-keys -t $SESSION:0.2 "python3" C-m

    # 6. Set focus back to Vim
    tmux select-pane -t $SESSION:0.1
fi

tmux attach-session -t $SESSION


