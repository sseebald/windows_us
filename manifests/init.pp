class windows_us {

  registry::value {'Disable Windows Update':
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate',
    value => DisableWindowsUpdateAccess,
    data  => 1,
    type  => dword,
  }

}
