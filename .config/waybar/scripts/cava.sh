#!/bin/bash
bars=("⠀" "⡀" "⣀" "⣄" "⣤" "⣦" "⣴" "⣾")
silence_threshold=10 # Number of silent frames before showing idle text
silence_counter=0

cava -p ~/.config/cava/config | while read -r line; do
    is_silent=true
    output=""
    
    # Check if the line contains any non-zero values
    for i in ${line//;/ }; do
        if [ "$i" -ne 0 ]; then
            is_silent=false
        fi
        output+="${bars[$i]}"
    done

    if [ "$is_silent" = true ]; then
        ((silence_counter++))
    else
        silence_counter=0
        echo "{\"text\": \"$output\", \"class\": \"active\"}"
    fi

    if [ "$silence_counter" -ge "$silence_threshold" ]; then
        echo "{\"text\": \"⣿⣿⣿⣿⣿⣿⣿⣿\", \"class\": \"idle\"}"
    fi
done


