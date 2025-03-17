alias now="date +'%Y-%m-%d %H:%M:%S'"
alias csv_to_json="jq -Rsn '(input | split(\"\n\") | .[1:] | map(select(length > 0) | split(\",\") | {url: .[0], path: .[1], params: null}))' > paths.json"
alias spotdl="docker run --rm -v ~/Music:/music spotdl/spotify-downloader download"
alias c="clear"
