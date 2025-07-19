#!/bin/bash

# Check if a search query is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <search_query>"
    exit 1
fi

# Define the output files
output_file="links.txt"
selection_output=""

# Encode the search query for the URL
search_query=$(echo "$1" | sed 's/ /+/g')

# Fetch links containing "watch?", number them, and save to the output file
curl -s "https://inv.nadeko.net/search?q=${search_query}" | grep -oP '<a href="\K[^"]*watch\?[^"]*' | nl -w2 -s'. ' > "$output_file"

# Notify the user
echo "Links have been saved to $output_file."

# Run the second command and store only the selected number in a variable
selection_output=$(curl -s "https://inv.nadeko.net/search?q=${search_query}" | \
grep '<p dir="auto">' | \
sed -E 's/.*>([^<]+)<.*/\1/' | \
sed 's/^[ \t]*//;s/[ \t]*$//' | \
nl -w2 -s'. ' | \
rofi -dmenu | \
cut -d'.' -f1 | tr -d ' ')

# Get the corresponding link from the links.txt file
selected_link=$(sed -n "${selection_output}p" "$output_file")

# Clean the selected link by removing any leading numbers and spaces
cleaned=$(echo $selected_link | cut -d' ' -f2-)

# Concatenate the final output with https://youtube.com
final="https://youtube.com${cleaned}"

mpv --ytdl-format="best[height<=480]" $final
