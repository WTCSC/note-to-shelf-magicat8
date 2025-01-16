#!/bin/bash

# File to store notes
NOTES_FILE="notes.txt"

touch "$NOTES_FILE"

# Add a note
add_note() {
    if [ -z "$1" ]; then
        echo "Error: Please provide note text."
        exit 1
    fi

    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    echo "$TIMESTAMP - $1" >> "$NOTES_FILE"
    echo "Note added."
}

# List notes
list_notes() {
    if [ ! -s "$NOTES_FILE" ]; then
        echo "No notes found."
    else
        cat "$NOTES_FILE"
    fi
}

# Search notes
search_notes() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a keyword to search."
        exit 1
    fi

    grep -i "$1" "$NOTES_FILE"
    if [ $? -ne 0 ]; then
        echo "No matching notes found."
    fi
}

# Main script
if [ "$1" == "add" ]; then
    add_note "$2"
elif [ "$1" == "list" ]; then
    list_notes
elif [ "$1" == "search" ]; then
    search_notes "$2"
else
    echo "Peramiters: $0 {add \"note text\"|list|search \"keyword\"}"
    exit 1
fi
