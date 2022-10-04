secret
=====

A small library to wrap secrets when passing them around to
supervisors or processes.  The goal is to avoid accidentally printing
those secrets in case of a process crash or restart.

Build
-----

    $ rebar3 compile
