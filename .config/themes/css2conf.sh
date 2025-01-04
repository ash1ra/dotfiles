#!/bin/bash

# Function to process color definitions
process_css_file() {
    local css_file="$1"
    local conf_file="$2"
    local dir="$(dirname "$css_file")"

    echo "Processing: $css_file"

    # Create temporary file
    local temp_file=$(mktemp)

    # Extract and convert color definitions
    while IFS= read -r line; do
        if [[ $line =~ @define-color[[:space:]]+([[:alnum:]_-]+)[[:space:]]+#([[:xdigit:]]{6})\; ]]; then
            local color_name="${BASH_REMATCH[1]}"
            local color_value="${BASH_REMATCH[2]}"
            echo "\$${color_name} = rgb(${color_value})" >> "$temp_file"
        fi
    done < "$css_file"

    # Check if any colors were found
    if [ ! -s "$temp_file" ]; then
        echo "No color definitions found in $css_file"
        rm "$temp_file"
        return
    fi

    # Handle conf file
    if [ ! -f "$conf_file" ]; then
        echo "Creating new $conf_file"
        touch "$conf_file"
    else
        # Remove old color definitions if file exists
        sed -i '/^\$.*= rgb(.*)$/d' "$conf_file"
    fi

    # Add new color definitions
    cat "$temp_file" >> "$conf_file"
    echo "Updated color definitions in $conf_file"

    # Clean up
    rm "$temp_file"
}

# Function to print usage
print_usage() {
    echo "Usage: $0 [directory]"
    echo "If no directory specified, processes style.css in the current directory"
    echo "Otherwise processes all style.css files in the specified directory tree"
    echo "Converts @define-color definitions from style.css to style.conf"
}

# Check if help is requested
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    print_usage
    exit 0
fi

# If no directory specified, process current directory only
if [ -z "$1" ]; then
    if [ -f "style.css" ]; then
        process_css_file "style.css" "style.conf"
    else
        echo "Error: style.css not found in current directory"
        exit 1
    fi
else
    # Check if directory exists
    if [ ! -d "$1" ]; then
        echo "Error: Directory '$1' does not exist"
        exit 1
    fi

    # Process all style.css files in the directory tree
    find "$1" -type f -name "style.css" | while read css_file; do
        conf_file="$(dirname "$css_file")/style.conf"
        process_css_file "$css_file" "$conf_file"
    done
fi

echo "Processing complete"
