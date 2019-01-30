#!/usr/bin/env bats

@test "python bin should exist" {
    [ -x "/usr/local/bin/python" ]
}

@test "python should be version 2.7.5" {
    /usr/local/bin/python -c 'import sys; print sys.version' | grep '2.7.5'
}
