# PowerShell Utilities (`UtilModule`)
![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/utilmodule?style=for-the-badge&logo=nuget) ![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/utilmodule?style=for-the-badge&logo=nuget&label=Powershell%20Version)

A small collection of standalone PowerShell helper commands — kill a port, decode a JWT, and mint an Azure Service Bus SAS token. Works on Windows PowerShell 5.1 and PowerShell 7+.

---
## Install
```powershell
Install-Module -Name UtilModule
```
---
## Naming convention
All commands use a **dotted namespace**: `UtilMan.<Name>`. Call them like any other command — positional args, named `-parameters`, short aliases, and the pipeline all work:
```powershell
UtilMan.KillPort 3000
```
---
## Commands

| Command            | Purpose                                        |
| ------------------ | ---------------------------------------------- |
| `UtilMan.KillPort` | Kill the process listening on a TCP port.      |
| `UtilMan.DecodeJwt`| Decode a JWT's header and payload.             |
| `UtilMan.SBToken`  | Generate an Azure Service Bus SAS token.       |

---
## Usage
### UtilMan.SBToken
```powershell
# First Method
UtilMan.SBToken <URL> <policy-name> <key> <time (optional)>

# Second Method
UtilMan.SBToken -uri <url> -policy <policy> -key <key> -time <time>

# third method
UtilMan.SBToken -u <url> -p <policy> -k <key> -t <time>

#forth method
>> UtilMan.SBToken
# you will be prompted to enter the necessary parameters
```
### UtilMan.DecodeJwt
```powershell
UtilMan.DecodeJwt <jwt-token>
```

---
### UtilMan.KillPort
```powershell
# Kill process on port 3000
UtilMan.KillPort 3000

# Using alias
UtilMan.KillPort -p 8080
```

---
## Get list of Commands
```powershell
Get-Command -Module UtilModule -CommandType Function
```

---
## Contributing
New commands follow the `UtilMan.<Name>` convention and must be wired up in three
places (function file, `UtilModule.psm1`, and `FunctionsToExport` in
`UtilModule.psd1`). See [`CLAUDE.md`](./CLAUDE.md) for the full contributor guide.
