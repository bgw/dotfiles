========
dotfiles
========

Disclaimer
==========

This repository is intended for my own personal use. If someone else can glean
anything from it, all the better, but it is not intended for anyone else to use.
Rather, I made this repository to help me configure any machine I use faster.

As a result of this, some configurations may not use best practices, or may have
some cruft. That's not the point. These are configuration files and such that
I've hacked together that I use and that work for me.

Installing
==========

You'll need to clone the repository and then all the submodules::

    git submodule update --init --recursive

Then just run::

    ./install.sh

Fair warning: *The install script does not ask you for permission to overwrite a
file*. It just does it.
