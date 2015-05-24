# We use xterm-256color-italic, which won't be supported on other hosts
alias ssh="hash keychain && start-keychain -q; TERM=xterm-256color ssh"
alias mosh="hash keychain && start-keychain -q; TERM=xterm-256color mosh"

KEYCHAIN_SSH_KEYS="id_rsa"
KEYCHAIN_GPG_KEYS="4E2569F1"

start-keychain() {
    # http://www.funtoo.org/Keychain#Linux
    if hash gpg-agent; then
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
