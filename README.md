windows_us
==========

Puppet module to manage windows updates. Sets up some of the more important windows update and windows auto update
features. Tested on Windows Server 2008 R2.

Usage:

class {'windows_us':
  wuserver => 'https://MyServer',
  wustatusserver => 'https://MyServer',
}
