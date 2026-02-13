# PowerShell version of load testing script for Windows
$URL = "http://localhost:30007"
$REQUESTS = 1000

Write-Host "Starting load test with $REQUESTS requests..."

$jobs = @()
for ($i = 1; $i -le $REQUESTS; $i++) {
    $jobs += Start-Job -ScriptBlock {
        param($url)
        try {
            Invoke-WebRequest -Uri $url -UseBasicParsing -ErrorAction SilentlyContinue | Out-Null
        } catch {}
    } -ArgumentList $URL
    
    # Display progress
    if ($i % 100 -eq 0) {
        Write-Host "Sent $i requests..."
    }
}

Write-Host "Waiting for all requests to complete..."
$jobs | Wait-Job | Out-Null
$jobs | Remove-Job

Write-Host "Load testing completed successfully!"
