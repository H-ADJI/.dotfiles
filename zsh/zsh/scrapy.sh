shub_deploy() {
    shub image upload $SHUB_DEVZONE --build-arg PYPI_SECRET=$PYPI_SECRET
}
# to persist spiders list, may cause inconsistencies
PERSIST_SPIDERS=1

fzf_spiders() {
    # Run FZF with a custom appearance
    cache_dir="$HOME/.local/share/scrapy"
    cache_file="/tmp/spiders.tmp"

    if [ $PERSIST_SPIDERS -eq 1 ]; then
        mkdir -p $cache_dir
        cache_file="$cache_dir/scrapy"
    fi

    if command -v scrapy &>/dev/null; then
        touch $cache_file
        scrapy list 2>/dev/null 1>$cache_file
    else
        print -P "\n%F{yellow}Using cached spider list (Last update: $(date -r "$cache_file" '+%m-%d-%Y %H:%M:%S' 2>/dev/null))%f"
    fi

    zle redisplay
    local spider=$(
        cat $cache_file 2>/dev/null | fzf --height 40% --layout=reverse \
            --border --prompt="Select Spider: " --pointer="▶ " --marker="✔ " \
            --preview="echo 'Spider: {}'" --preview-window=down:1:wrap
    )

    # Insert the selected spider name into the command line
    if [ -n "$spider" ]; then
        LBUFFER="${LBUFFER}${spider} "
    fi
    zle redisplay
}
# Define the widget and bind it to Ctrl+f
zle -N fzf_spiders
bindkey '^f' fzf_spiders

docker_spider() {
    if [ $# -lt 2 ]; then
        echo "Usage: $0 <units> <spider_name> [any additional scrapy args]"
        echo "Example: $0 2 my_spider -a crawl_id=1337"
        return
    fi
    # Arguments
    UNITS=$1
    SPIDER_NAME=$2
    EXTRA_ARGS="${@:3}" # all remaining args after the second

    # Compute resources
    MEMORY=$((UNITS * 1024))M # 1 unit = 1GB RAM

    # Run the container with the specified resources
    echo "Running spider '$SPIDER_NAME' with $UNITS unit(s) ($MEMORY RAM, $CPUS CPU)..."

    docker image build -t test_docker_spider --build-arg PYPI_SECRET=$PYPI_SECRET .
    docker container run --cpus=$UNITS --memory="$MEMORY" \
        --env-file .env --env V4_PROXIES="$V4_PROXIES" \
        --env GOOGLE_APPLICATION_CREDENTIALS_BANNERS_IMAGES=$GOOGLE_APPLICATION_CREDENTIALS_BANNERS_IMAGES \
        --env GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS \
        test_docker_spider scrapy crawl $SPIDER_NAME $EXTRA_ARGS

}
