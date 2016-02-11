alias ssh="hash keychain 2>/dev/null && start-keychain -q; ssh"
alias mosh="hash keychain 2>/dev/null && start-keychain -q; mosh"

KEYCHAIN_SSH_KEYS="id_rsa"
KEYCHAIN_GPG_KEYS="4E2569F1"

start-keychain() {
    # http://www.funtoo.org/Keychain#Linux
    if hash gpg-agent 2> /dev/null; then
        eval $(keychain --eval --agents gpg,ssh "$@" \
               $KEYCHAIN_SSH_KEYS)
    else
        eval $(keychain --eval --agents ssh "$@" \
               $KEYCHAIN_SSH_KEYS $KEYCHAIN_GPG_KEYS)
    fi
}

stop-keychain() {
    keychain --stop all
}
