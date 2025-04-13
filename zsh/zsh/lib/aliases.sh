alias now="date +'%Y-%m-%d %H:%M:%S'"
alias csv_to_json="jq -Rsn '(input | split(\"\n\") | .[1:] | map(select(length > 0) | split(\",\") | {url: .[0], path: .[1], params: null}))' > paths.json"
alias spotdl="docker run --rm -v ~/Music:/music spotdl/spotify-downloader download"
alias c="clear"
alias q="exit"
alias ..="cd .."
alias mkdir="mkdir -pv"
alias grep="grep --color=auto"
alias copy="wl-copy"
alias pst="wl-paste"
# alias brave="brave --password-store=basic"
alias unlock_transcrypt="transcrypt -y -p "
pdfgrep_log_to_csv() {
    local word="$1"
    local dir="${2:-.}"                            # Default to current directory if not provided
    local output_file="${3:-"${word}_result.csv"}" # Default to word_result.csv if not provided

    # Header for the CSV
    echo "Word,File Name,Line Text" >"$output_file"

    # Search for the word in PDFs and log matches
    find "$dir" -type f -iname "*.pdf" | while read -r file; do
        pdfgrep -in --color=never "$word" "$file" | while IFS=: read -r line_num line_text; do
            # Escape commas and quotes for CSV formatting
            line_text=$(echo "$line_text" | sed 's/"/""/g' | sed 's/,/\\,/g')
            # Log the results in CSV format
            echo "\"$word\",\"$file\",\"$line_text\"" >>"$output_file"
        done
    done
}
