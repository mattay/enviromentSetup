# Function to install a list of casks or apps

# Homebrew
if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew"
    brew update
fi

brew_install_list() {
    local file="$1"
    local is_cask="$2"
    local install_type
    if [[ "$is_cask" == "true" ]]; then
        install_type="cask"
    else
        install_type="formula"
    fi

    if [[ -f "$file" ]]; then
        log_message "Checking for $install_type applications to install from $file..."
        NOT_INSTALLED=$(comm -23 <(sort < "$file") <(brew list --installed-on-request | sort | awk '{print $1}') | strip-empty)

        if [[ -z "$NOT_INSTALLED" ]]; then
            log_message "All applications in $file are already installed."
        else
            for app in $(echo $NOT_INSTALLED); do
                log_message "Installing $app..."

                if [[ "$is_cask" == "true" ]]; then
                    # if brew install --cask $app &>> "$LOG_FILE"; then
                    if brew install --cask $app; then
                        log_message "$app installed successfully."
                    else
                        log_message "Failed to install $app."
                    fi

                else
                    # if brew install $app &>> "$LOG_FILE"; then
                    if brew install $app; then
                        log_message "$app installed successfully."
                    else
                        log_message "Failed to install $app."
                    fi
                fi


            done
        fi
    else
        log_message "File $file not found."
    fi

}