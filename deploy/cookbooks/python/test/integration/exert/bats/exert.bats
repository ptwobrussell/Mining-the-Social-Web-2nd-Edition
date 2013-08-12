#!/usr/bin/env bats

@test "virtualenv test environment should exist" {
     [ -f "/tmp/kitchen-chef-solo/cache/virtualenv/bin/activate" ]
}

@test "virtualenv test environment should be owned by root" {
    ls -l /tmp/kitchen-chef-solo/cache/virtualenv | grep "root root"
}

@test "virtualenv test environment should have boto working" {
    /tmp/kitchen-chef-solo/cache/virtualenv/bin/python -c 'import boto; boto.Version'
}

