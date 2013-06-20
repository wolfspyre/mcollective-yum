### About the Yum agent:
Nathan made liberal use of the code contained in the main mcollective repo:

  https://github.com/puppetlabs/mcollective-plugins/tree/master/agent/package/agent

to make the original work behind this module here:
  https://github.com/slaney/mcollective-plugins

### Usage Yum agent:

Install a package on all hosts:

     sudo mco rpc yum install xclock

Upgrade a package on all hosts:

     sudo mco rpc yum upgrade xclock

Reinstall a package on all hosts:

     sudo mco rpc yum reinstall xclock

Check for available updates:

     sudo mco rpc yum check-update

Patch all hosts to the latest patch level (either by repo, rhn or satellite sync):

     sudo mco rpc yum update # note this is the same thing as concurrently running `yum update -y` on ALL hosts

Patch all hosts to the latest patch level and reboot afterwards  (either by repo, rhn or satellite sync):

     sudo mco rpc yum update-and-reboot # note this is the same thing as concurrently running `yum update -y&&shutdown -r now` on ALL hosts

Stage all available patches on servers (that have the downloadonly plugin)

     sudo mco rpc yum downloadonly

Stage a specfic package on servers (that have the downloadonly plugin)

     sudo mco rpc yum downloadonly package=xclock

Clean various caches // Note: I borrowed this code from the main mcollective plugins repo:

     sudo mco rpc yum clean # This defaults to all if package.yum_clean_mode set
     sudo mco rpc yum clean mode=all
     sudo mco rpc yum clean mode=headers
     sudo mco rpc yum clean mode=packages
     sudo mco rpc yum clean mode=metadata
     sudo mco rpc yum clean mode=dbcache
     sudo mco rpc yum clean mode=plugins
     sudo mco rpc yum clean mode=expire-cache
