LOG_FILE="$HOME/installation_log.txt"

# Function to log messages
log_message() {
    local message="$1"
    # echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message"
}
