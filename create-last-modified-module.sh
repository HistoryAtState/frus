#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# create XML files containing last modified dates for each input file
# stores them in .last-modified/ directory with same relative path structure

# -----------------------------------------------------------------------------
# USAGE:
# ./create-last-modified-module.sh volumes bibliography

# Sample usage of generated data in XQuery. Because '/' is forbidden in eXistdb 
# fn:id() function it is replaced with '0x2F' (hex for '/')
# 
# XQuery: 
# let $frus_last_modified := collection("/db/apps/frus/.last-modified")
# let $path := "volumes/frus1981-88v04.xml"
#  return
#     $frus_last_modified/id(replace($path, "/", "0x2F"))
# 
# -----------------------------------------------------------------------------
# Error handling
set -e # Exit on error
set -u # Exit on undefined variable

# create output directory if it doesn't exist
if ! mkdir -p .last-modified; then
    echo "Error: Failed to create .last-modified directory" >&2
    exit 1
fi

process_file() {
    local file=$1
    
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "Error: File '$file' does not exist" >&2
        return 1
    fi
    
    # Get last commit date in ISO format    
    if ! iso=$(git log -1 --format=%cd --date=format-local:'%Y-%m-%dT%H:%M:%S%z' "$file"); then
        echo "Error: Failed to get git log for '$file'" >&2
        return 1
    fi
    
    # Create output directory structure
    dir=$(dirname ".last-modified/$file")
    if ! mkdir -p "$dir"; then
        echo "Error: Failed to create directory '$dir'" >&2
        return 1
    fi
    
    # Replace any forward slashes in path with underscores for xml:id
    xml_id=${file//\//0x2F}
    
    # Convert date to seconds since epoch
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! seconds_since_epoch=$(date -j -f "%Y-%m-%dT%H:%M:%S%z" "$iso" "+%s"); then
            echo "Error: Failed to convert date for '$file'" >&2
            return 1
        fi
    else
        if ! seconds_since_epoch=$(date -d "$iso" +%s); then
            echo "Error: Failed to convert date for '$file'" >&2
            return 1
        fi
    fi
    
    # Write XML files
    if ! echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > ".last-modified/$file"; then
        echo "Error: Failed to write XML header for '$file'" >&2
        return 1
    fi
    
    if ! echo "<last-modified xml:id=\"$xml_id\" seconds_since_epoch=\"$seconds_since_epoch\">$iso</last-modified>" >> ".last-modified/$file"; then
        echo "Error: Failed to write XML content for '$file'" >&2
        return 1
    fi
}

# Check if arguments provided
if [ $# -eq 0 ]; then
    echo "Error: No input files specified" >&2
    echo "Usage: $0 <path to directory or file>" >&2
    exit 1
fi

for path in "${@}"
do
    if [ ! -e "$path" ]; then
        echo "Error: Path '$path' does not exist" >&2
        continue
    fi
    
    if [ -d "$path" ]; then
        # If directory, process all files recursively
        while IFS= read -r file; do
            if ! process_file "$file"; then
                echo "Warning: Failed to process '$file'" >&2
            fi
        done < <(find "$path" -type f)
    else
        # If regular file, process directly
        if ! process_file "$path"; then
            echo "Warning: Failed to process '$path'" >&2
        fi
    fi
done