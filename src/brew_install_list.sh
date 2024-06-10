source src/log_message.sh

# Setup Homebrew
if [[ $(command -v brew) == "" ]]; then
    log_message "Installing Hombrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    log_message "Updating Homebrew"
    brew update
fi

# Install a list of casks or formulae with Homebrew
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
        NOT_INSTALLED=$(comm -23 <(sort "$file") <(brew list -1 --"$install_type"))

        if [[ -z "$NOT_INSTALLED" ]]; then
            log_message "All applications in $file are already installed."
        else
            for app in $(echo $NOT_INSTALLED); do
                log_message "Installing $app..."

                if [[ "$is_cask" == "true" ]]; then
                    if brew install --cask $app; then
                        log_message "$app installed successfully."
                    else
                        log_message "Failed to install $app."
                    fi

                else
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
