class windows_us ($wuserver = undef, $wustatusserver = undef){

  ###############################     Settings for Windows Update     ##############################

  registry::value {'Enable Windows Update':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate',
    value => DisableWindowsUpdateAccess,
    data  => 0, #1 = Disable WU, 0 = Enable WU
    type  => dword,
  }

  registry::value {'Set Windows Update Server':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate',
    value => WUServer,
    data  => $WUServer,
    type  => string,
  }

  registry::value {'Set Windows Update Status Server':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate',
    value => WUStatusServer,
    data  => $WUStatusServer,
    type  => string,
  }

  ################################ Settings for Windows Auto Updates ###############################

  registry::value {'Auto Install Minor Updates':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => AutoInstallMinorUpdates,
    data  => 1, #0 = Treat them like other updates, 1 = Silently install them
    type  => dword,
  }

  registry::value {'Auto Updates':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => NoAutoUpdate,
    data  => 0, #0 = Enable AU, 1 = Disable AU
    type  => dword,
  }

  registry::value {'Scheduled Install Day':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => ScheduledInstallDay,
    data  => 1, #1-7, Sunday(1), Saturday(7)
    type  => dword,
  }

  registry::value {'Scheduled Install Time':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => ScheduledInstallTime,
    data  => 23, #Value in a 24 hour time frame, 0-23
    type  => dword,
  }

  registry::value {'Install from WUServer':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    value => UseWUServer,
    data  => 1, #0 = Get from Microsoft Update, 1 = Get from WSUS Server specified above.
    type  => dword,
  }
}
