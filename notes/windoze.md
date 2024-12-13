## Windows
Hmmm...

### Map caps lock to control
Source: <https://superuser.com/a/949533>.

```Windows Registry Entries
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00
```

### Disable UAC for a specific program
Sources:
- <https://superuser.com/a/1813430>
- <https://superuser.com/a/1753142>

```Windows Registry Entries
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers]
"C:\\path\\to\\program\\with\\double\\backslashes.exe"="~ RUNASINVOKER"
```

### Disable `ms-gaming-overlay-link` popup
Source: <https://old.reddit.com/r/WindowsHelp/comments/108ngxr/properly_uninstalling_xbox_gamebar_and_resolve/>.

```bat
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR /f /t REG_DWORD /v "AppCaptureEnabled" /d 0
reg add HKEY_CURRENT_USER\System\GameConfigStore /f /t REG_DWORD /v "GameDVR_Enabled" /d 0
```

### Miscellaneous Links
- Generate `autounattend.xml` files for Windows 10/11: <https://schneegans.de/windows/unattend-generator/>.
- Editing registry using a `.reg` file: <https://support.microsoft.com/en-us/topic/how-to-add-modify-or-delete-registry-subkeys-and-values-by-using-a-reg-file-9c7f37cf-a5e9-e1cd-c4fa-2a26218a1a23>
