#!/usr/bin/env bats

@test "virtualenv test environment should exist" {
    [ -f "/tmp/virtualenv/bin/activate" ]
}

@test "virtualenv test environment should be owned by root" {
    ls -l /tmp/virtualenv | grep "root root"
}

@test "virtualenv test environment should have a working python" {
    /tmp/virtualenv/bin/python -c 'import sys; print sys.version'
}

@test "virtualenv resource should be able to delete an environment" {
    [ ! -d "/tmp/tobedestroyed" ]
}
