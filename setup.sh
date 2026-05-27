#!/bin/bash

INSTALL_DIR="$HOME/.local/share/fake-hack"
SCRIPT_NAME="fake-hack.sh"
BASHRC="$HOME/.bashrc"

install_prank() {
    echo "⚙️  Installing Ultimate Fake Hack Prank..."
    
    # Create installation directory if it doesn't exist
    mkdir -p "$INSTALL_DIR"
    
    # Copy the core script there
    cp "$SCRIPT_NAME" "$INSTALL_DIR/$SCRIPT_NAME"
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
    
    # Check if it's already added to .bashrc to avoid duplicates
    if grep -q "fake-hack.sh" "$BASHRC"; then
        echo "ℹ️  Prank is already configured in your .bashrc!"
    else
        # Safely append the source hook to the bottom of .bashrc
        echo "" >> "$BASHRC"
        echo "# Load Ultimate Fake Terminal Hack Prank" >> "$BASHRC"
        echo "if [ -f \"$INSTALL_DIR/$SCRIPT_NAME\" ]; then" >> "$BASHRC"
        echo "    source \"$INSTALL_DIR/$SCRIPT_NAME\"" >> "$BASHRC"
        echo "fi" >> "$BASHRC"
        echo "✅ Successfully added to $BASHRC!"
    fi
    
    echo -e "\n🎉 Installation complete! Open a new terminal window or run:"
    echo -e "   \e[1;32msource ~/.bashrc\e[0m"
    echo -e "   Then try typing: \e[1;31msudo hack your_friend\e[0m"
}

uninstall_prank() {
    echo "🧹 Uninstalling Fake Hack Prank..."
    
    # Remove the files
    if [ -d "$INSTALL_DIR" ]; then
        rm -rf "$INSTALL_DIR"
        echo "🗑️  Removed script files from $INSTALL_DIR"
    fi
    
    # Clean up .bashrc using sed to remove the injected lines
    if [ -f "$BASHRC" ]; then
        # Creates a backup just in case, then deletes the specific configuration block
        sed -i.bak '/# Load Ultimate Fake Terminal Hack Prank/,/fi/d' "$BASHRC"
        echo "✨ Cleaned up entries from $BASHRC (Backup saved as .bashrc.bak)"
    fi
    
    echo "✅ Uninstallation complete. Restart your terminal to clear changes."
}

# Handle command line arguments
case "$1" in
    install)
        install_prank
        ;;
    uninstall)
        uninstall_prank
        ;;
    *)
        echo "Usage: $0 {install|uninstall}"
        exit 1
        ;;
esac
