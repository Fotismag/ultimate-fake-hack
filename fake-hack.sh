#!/2bin/bash
# ==============================================================================
# Ultimate Fake Terminal Hack Prank with Dynamic Password Cache
# ==============================================================================

sudo() {
    if [ "$1" = "hack" ]; then
        shift # Remove the word 'hack'
        local target="$*"

        if [ -z "$target" ]; then
            echo "Error: Please specify a target. Usage: sudo hack [name]"
            return 1
        fi

        # Check if real sudo is already authenticated/cached
        if command sudo -n true 2>/dev/null; then
            # Real sudo is cached! Skip the prompt entirely
            echo -e "\e[1;34m[*] Sudo credentials cached. Bypassing authentication...\e[0m"
            sleep 0.5
        else
            # Real sudo has timed out or hasn't run yet. Prompt for password!
            echo -n "[sudo] password for $USER: "
            read -s password
            echo "" # Prints a clean new line after hitting enter
        fi

        echo -e "\e[1;31m[!] INITIALIZING CYBER OVERRIDE ON TARGET: $target...\e[0m"
        sleep 1.2

        # Fake Matrix-style scroll effect
        for i in {1..40}; do
            echo -e "\e[32m01001000 01000011 01001011 01000101 01000101 $RANDOM $RANDOM $RANDOM $RANDOM\e[0m"
            sleep 0.03
        done

        echo -e "\e[1;34m[*] Establishing secure terminal handshake...\e[0m"
        sleep 1.5
        echo -e "\e[1;33m[*] Configuring individual's passwords and email...\e[0m"
        sleep 2
        echo -e "\e[1;33m[*] Locating digital Currencies...\e[0m"
        sleep 1.8
        echo -e "\e[1;33m[*] Claiming Passwords...\e[0m"
        sleep 2.2
        echo -e "\e[1;33m[*] Claiming Digital Account Personal Info...\e[0m"
        sleep 1.5

        # Fast final matrix calculation burst
        for i in {1..15}; do
            echo -e "\e[32m[DECRYPTING BITSTREAM PACKETS] ==> SUCCESS_HEX_VAL_0x$(printf '%X\n' $RANDOM)\e[0m"
            sleep 0.05
        done
        sleep 1

        echo -e "\e[1;32m[+] Done. $target has been hacked successfully.\e[0m"
    else
        # If it's not 'sudo hack', run the normal system sudo command flawlessly
        command sudo "$@"
    fi
}

# Block regular 'hack' without sudo
hack() {
    echo "error: you cannot perform this operation unless you are root."
    return 1
}
