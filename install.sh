
#!/usr/bin/env bash
# install.sh - simple installer for lyf port scanner

set -e

SCRIPT_NAME="lyf"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo "[+] Installing $SCRIPT_NAME to $INSTALL_PATH"

# Ensure script is executable
chmod +x "$SCRIPT_NAME"

# Copy to /usr/local/bin (needs sudo if not root)
if [ "$(id -u)" -ne 0 ]; then
  sudo cp "$SCRIPT_NAME" "$INSTALL_PATH"
else
  cp "$SCRIPT_NAME" "$INSTALL_PATH"
fi

echo "[+] Installed. You can now run it anywhere like:"
echo
echo "    lyf scan https://example.com -t 0.5 -c 400"
echo
echo "[+] Done!"
