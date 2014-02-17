# Debian VBox virtual machine
debvm-start() {
    echo "Once VM is booted, run: ssh debian_vm"
    VBoxHeadless -startvm 'Debian Squeeze (Minimal)'
}

debvm-stop() {
    VBoxManage controlvm 'Debian Squeeze (Minimal)' acpipowerbutton
}

debvm-cp() {
    rsync -rtp --delete "$1" "debian_vm:$2"
}

# On the UF CISE servers, aliases for simple quota lookups
# TODO: Rewrite this, the implementation kinda sucks
if [ `hostname` = "storm" ] || [ `hostname` = "thunder" ]; then
    export LOCAL_QUOTA="$(quota -vsw 2> /dev/null | grep woodruff | tail -n 1 |\
                        tr -s " " "\012")"
    export QUOTA_USAGE="$(echo $LOCAL_QUOTA | sed -n 2p)"
    export QUOTA_TOTAL="$(echo $LOCAL_QUOTA | sed -n 3p)"
    alias simplequota='echo "Using $QUOTA_USAGE out of $QUOTA_TOTAL."'
fi
