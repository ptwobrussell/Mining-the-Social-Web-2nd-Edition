## v2.1.0:

- [COOK-3426]: cacher-ng fails with restrict_environment set to true
- [COOK-2859]: cacher-client executes out of order
- [COOK-3052]: Long GPG keys are downloaded on every run
- [COOK-1856]: apt cookbook should match keys without case sensitivity
- [COOK-3255]: Attribute name incorrect in README
- [COOK-3225]: Call use_inline_resources only if defined
- Greatly expanded test coverage with ChefSpec and Test-Kitchen

## v2.0.0:

### Bug

- [COOK-2258]: apt: LWRP results in error under why-run mode in apt 1.9.0 cookbook

## v1.10.0:

### Improvement

- [COOK-2885]: Improvements for apt cache server search

### Bug

- [COOK-2441]: Apt recipe broken in new chef version
- [COOK-2660]: Create Debian 6.0 "squeeze" specific template for
  apt-cacher-ng

## v1.9.2:

* [COOK-2631] - Create Ubuntu 10.04 specific template for apt-cacher-ng

## v1.9.0:

* [COOK-2185] - Proxy for apt-key
* [COOK-2338] - Support pinning by glob() or regexp

## v1.8.4:

* [COOK-2171] - Update README to clarify required Chef version: 10.18.0
  or higher.

## v1.8.2:

* [COOK-2112] - need [] around "arch" in sources.list entries
* [COOK-2171] - fixes a regression in the notification

## v1.8.0:

* [COOK-2143] - Allow for a custom cacher-ng port
* [COOK-2171] - On `apt_repository.run_action(:add)` the source file
  is not created.
* [COOK-2184] - apt::cacher-ng, use `cacher_port` attribute in
  acng.conf

## v1.7.0:

* [COOK-2082] - add "arch" parameter to apt_repository LWRP

## v1.6.0:

* [COOK-1893] - `apt_preference` use "`package_name`" resource instead of "name"
* [COOK-1894] - change filename for sources.list.d files
* [COOK-1914] - Wrong dir permissions for /etc/apt/preferences.d/
* [COOK-1942] - README.md has wrong name for the keyserver attribute
* [COOK-2019] - create 01proxy before any other apt-get updates get executed

## v1.5.2:

* [COOK-1682] - use template instead of file resource in apt::cacher-client
* [COOK-1875] - cacher-client should be Environment-aware

## V1.5.0:

* [COOK-1500] - Avoid triggering apt-get update
* [COOK-1548] - Add execute commands for autoclean and autoremove
* [COOK-1591] - Setting up the apt proxy should leave https
  connections direct
* [COOK-1596] - execute[apt-get-update-periodic] never runs
* [COOK-1762] - create /etc/apt/preferences.d directory
* [COOK-1776] - apt key check isn't idempotent

## v1.4.8:

* Adds test-kitchen support
* [COOK-1435] - repository lwrp is not idempotent with http key

## v1.4.6:

* [COOK-1530] - apt_repository isn't aware of update-success-stamp
  file (also reverts COOK-1382 patch).

## v1.4.4:

* [COOK-1229] - Allow cacher IP to be set manually in non-Chef Solo
  environments
* [COOK-1530] - Immediately update apt-cache when sources.list file is dropped off

## v1.4.2:

* [COOK-1155] - LWRP for apt pinning

## v1.4.0:

* [COOK-889] - overwrite existing repo source files
* [COOK-921] - optionally use cookbook\_file or remote\_file for key
* [COOK-1032] - fixes problem with apt repository key installation
