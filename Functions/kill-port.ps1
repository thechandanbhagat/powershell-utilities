function UtilMan.KillPort {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [Alias("p")]
        [int]$Port
    )

    # @group PortLookup : Find process listening on the specified port
    $connections = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue

    if (-not $connections) {
        Write-Host "No process listening on port $Port"
        return
    }

    $processIds = $connections.OwningProcess | Sort-Object -Unique

    # @group ProcessKill : Stop each process occupying the port
    foreach ($procId in $processIds) {
        $proc = Get-Process -Id $procId -ErrorAction SilentlyContinue

        if (-not $proc) {
            Write-Warning "PID $procId not accessible - may require elevated privileges"
            continue
        }

        Write-Host "Killing '$($proc.ProcessName)' (PID $procId) on port $Port"
        Stop-Process -Id $procId -Force
        Write-Host "Port $Port is now free"
    }
}

Export-ModuleMember -Function UtilMan.KillPort
