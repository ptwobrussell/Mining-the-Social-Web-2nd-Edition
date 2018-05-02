## v1.0.4

* [COOK-2351] - add `run_template_name` to allow alternate run script
  template

## v1.0.2:

* [COOK-2299] - runit_service resource does not properly start a
  non-running service

## v1.0.0:

* [COOK-2254] - (formerly CHEF-154) Convert `runit_service` definition
  to a service resource named `runit_service`.

This version has some backwards incompatible changes (hence the major
version bump). It is recommended that users pin the cookbook to the
previous version where it is a dependency until this version has been
tested in a non-production environment (use version 0.16.2):

    depends "runit", "<= 0.16.2"

If you use Chef environments, pin the version in the appropriate
environment(s).

**Changes of note**

1. The "runit" recipe must be included before the runit_service resource
can be used.
2. The `runit_service` definition created a separate `service`
resource for notification purposes. This is still available, but the
only actions that can be notified are `:start`, `:stop`, and `:restart`.
3. The `:enable` action blocks waiting for supervise/ok after the
service symlink is created.
4. User-controlled services should be created per the runit
documentation; see README.md for an example.
5. Some parameters in the definition have changed names in the
resource. See below.

The following parameters in the definition are renamed in the resource
to clarify their intent.

* directory -> sv_dir
* active_directory -> service_dir
* template_name -> use service_name (name attribute)
* nolog -> set "log" to false
* start_command -> unused (was previously in the "service" resource)
* stop_command -> unused (was previously in the "service" resource)
* restart_command -> unused (was previously in the "service" resource)

## v0.16.2:

* [COOK-1576] - Do not symlink /etc/init.d/servicename to /usr/bin/sv
  on debian
* [COOK-1960] - default_logger still looks for sv-service-log-run
  template
* [COOK-2035] - runit README change

## v0.16.0:

* [COOK-794] default logger and `no_log` for `runit_service`
  definition
* [COOK-1165] - restart functionality does not work right on Gentoo
  due to the wrong directory in the attributes
* [COOK-1440] - Delegate service control to normal user

## v0.15.0:

* [COOK-1008] - Added parameters for names of different templates in runit
