#!/bin/bash

state=$(cat "$HOME"/.cache/redshift-temp)

case "$state" in
0)
    text="🔆"
    class="off"
    ;;
1)
    text=""
    class="low"
    ;;
2)
    text="●"
    class="high"
    ;;
*)
    text="?"
    class="unknown"
    ;;
esac

echo "{\"text\": \"$text\", \"class\": \"$class\"}"
