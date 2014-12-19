; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Wii U USB GCN adapter"
#define MyAppVersion "2.5"
#define MyAppPublisher "Matt Cunningham"
#define MyAppURL "https://github.com/elmassivo/GCN-USB-Adapter"
#define MyAppExeName "GCNUSBFeeder.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B3898604-95BA-4EBA-A8D7-C4C2BDC2712A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\GCNadapter
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=WiiU-UsbSetup
SetupIconFile=E:\C#\GCNUSBFeeder\GCNUSBFeeder\icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "E:\C#\GCN-USB-Adapter\LibUSB\device specification.htm"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\install-filter.exe"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\install.bat"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\installer_x64.exe"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\installer_x86.exe"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\libusb-win32-bin-README.txt"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\uninstall.bat"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\WUP-028.cat"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\WUP-028.inf"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\amd64\libusb0.dll"; DestDir: "{app}\LibUSB\amd64"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\amd64\libusb0.sys"; DestDir: "{app}\LibUSB\amd64"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\ia64\libusb0.dll"; DestDir: "{app}\LibUSB\ia64"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\ia64\libusb0.sys"; DestDir: "{app}\LibUSB\ia64"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\license\libusb-win32\installer_license.txt"; DestDir: "{app}\LibUSB\license\libusb-win32"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\x86\libusb0.sys"; DestDir: "{app}\LibUSB\x86"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\x86\libusb0_x86.dll"; DestDir: "{app}\LibUSB\x86"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\GCNUSBFeeder.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\GCNUSBFeeder.vshost.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\LibUsbDotNet.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\LibUsbDotNet.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\vJoyInterface.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\bin\x86\Release\vJoyInterfaceWrap.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\x86\libusb0_x86.dll"; DestDir: "{sys}"; DestName: "libusb0.dll"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsX86
Source: "E:\C#\GCN-USB-Adapter\LibUSB\x86\libusb0.sys"; DestDir: "{sys}\drivers"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsX86
Source: "E:\C#\GCN-USB-Adapter\LibUSB\amd64\libusb0.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsX64
Source: "E:\C#\GCN-USB-Adapter\LibUSB\amd64\libusb0.sys"; DestDir: "{sys}\drivers"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsX64
Source: "E:\C#\GCN-USB-Adapter\LibUSB\ia64\libusb0.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsI64
Source: "E:\C#\GCN-USB-Adapter\LibUSB\ia64\libusb0.sys"; DestDir: "{sys}\drivers"; Flags: uninsneveruninstall replacesameversion restartreplace promptifolder; Check: IsI64
Source: "E:\C#\GCN-USB-Adapter\vJoy\ConfigJoysticks.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\vJoy\UninstallJoysticks.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\vJoy\vJoy_204_I220914.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\HardwareHelperLib\HardwareHelperLib.dll"; DestDir: "{app}\HardwareHelperLib"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\GCNUSBFeeder\HardwareHelperLib\HardwareHelperLib.exe"; DestDir: "{app}\HardwareHelperLib"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\dpinst32.exe"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\dpinst64.exe"; DestDir: "{app}\LibUSB"; Flags: ignoreversion
Source: "E:\C#\GCN-USB-Adapter\LibUSB\dpinst.xml"; DestDir: "{app}\LibUSB"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\LibUSB\dpinst32.exe"; WorkingDir: "{app}\LibUSB"; Flags: waituntilterminated; Check: not IsWin64
Filename: "{app}\LibUSB\dpinst64.exe"; WorkingDir: "{app}\LibUSB"; Flags: waituntilterminated; Check: IsWin64
Filename: "{app}\vJoy_204_I220914.exe"; WorkingDir: "{app}"; Flags: waituntilterminated
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"

[Dirs]
Name: "{app}\LibUSB"
Name: "{app}\vJoy"
Name: "{app}\LibUSB\amd64"
Name: "{app}\LibUSB\ia64"
Name: "{app}\LibUSB\license"
Name: "{app}\LibUSB\license\libusb-win32"
Name: "{app}\LibUSB\x86"

[UninstallRun]
Filename: "{app}\LibUSB\dpinst32.exe"; Parameters: "/u WUP-028.inf"; WorkingDir: "{app}\LibUSB"; Flags: waituntilterminated; Check: not IsWin64
Filename: "{app}\LibUSB\dpinst64.exe"; Parameters: "/u WUP-028.inf"; WorkingDir: "{app}\LibUSB"; Flags: waituntilterminated; Check: IsWin64

[Code]
function IsX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsI64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function IsX86: Boolean;
begin
  Result := not IsX64 and not IsI64;
end;

function Is64: Boolean;
begin
  Result := IsX64 or IsI64;
end;
