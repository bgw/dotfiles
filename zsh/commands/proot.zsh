# Proot is a pure-userspace `chroot` and `mount --bind` implementation. It uses
# ptrace to mess with underlying processes without needed escalated privileges.

# Some userland images can be a bit picky, this tries to satisfy some of the
# most common sticking points.
# Example Usage: `simple-proot . bash`
function simple-proot() {
    PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG="C" \
    proot -0 -R "$@"
}

# Some proot hints:
#
# -   `aptitude` seems to crash on exit. This doesn't appear to impact package
#     installation, but apt-get works just fine, so use that instead.
# -   Images can be downloaded from: http://proot.me/#downloads
