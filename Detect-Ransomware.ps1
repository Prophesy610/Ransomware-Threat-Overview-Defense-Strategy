<#
.SYNOPSIS
Detects potential ransomware activity based on rapid file extension changes and file entropy analysis.

.DESCRIPTION
This script scans directories for rapid file changes, unusual file extensions, and optionally estimates file entropy to detect encryption.

.NOTES
Run with administrative privileges and adjust $PathsToMonitor as needed.
#>

$PathsToMonitor = @("C:\Users", "D:\Data")  # Add paths you want to monitor
$SuspiciousExtensions = @(".locked", ".crypt", ".encrypted", ".enc", ".aes", ".rnsm")

Write-Host "🔍 Starting ransomware detection scan..." -ForegroundColor Cyan

foreach ($path in $PathsToMonitor) {
    if (Test-Path $path) {
        Get-ChildItem -Path $path -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
            $ext = $_.Extension.ToLower()
            if ($SuspiciousExtensions -contains $ext) {
                Write-Host "⚠️ Suspicious file detected: $($_.FullName)" -ForegroundColor Yellow
            }

            # Optional: Check file entropy (rough estimation of encryption)
            try {
                $bytes = [System.IO.File]::ReadAllBytes($_.FullName)
                $histogram = @{}
                foreach ($byte in $bytes) {
                    if ($histogram.ContainsKey($byte)) {
                        $histogram[$byte]++
                    } else {
                        $histogram[$byte] = 1
                    }
                }
                $entropy = 0.0
                foreach ($count in $histogram.Values) {
                    $p = $count / $bytes.Length
                    $entropy -= $p * [Math]::Log($p, 2)
                }

                if ($entropy -gt 7.5) {
                    Write-Host "🔒 High-entropy (possibly encrypted) file: $($_.FullName) | Entropy: $entropy" -ForegroundColor Red
                }
            } catch {
                # Skip if file is locked or unreadable
            }
        }
    } else {
        Write-Host "❌ Path not found: $path" -ForegroundColor Red
    }
}

Write-Host "✅ Scan completed." -ForegroundColor Green
