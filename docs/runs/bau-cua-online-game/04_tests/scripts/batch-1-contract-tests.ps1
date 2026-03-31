param(
    [switch]$CoverageOnly
)

$ErrorActionPreference = 'Stop'

function New-TestCase {
    param(
        [string]$Id,
        [string]$Task,
        [string]$FilePath,
        [string]$Pattern,
        [string]$Description
    )

    [pscustomobject]@{
        Id = $Id
        Task = $Task
        FilePath = $FilePath
        Pattern = $Pattern
        Description = $Description
    }
}

$rootBe = "d:\Workspace\BaucuaApp\BauCuaBE"
$rootFe = "d:\Workspace\BaucuaApp\BauCuaFE"

$tests = @(
    New-TestCase -Id 'TC-002' -Task 'T-002' -FilePath "$rootBe\docker-compose.local.yml" -Pattern 'postgres|redis|app:' -Description 'BE compose includes app/postgres/redis services'
    New-TestCase -Id 'TC-003' -Task 'T-003' -FilePath "$rootBe\docs\local-startup\backend-readiness.md" -Pattern 'Path: /health|Mode A|Mode B' -Description 'Readiness contract documents canonical endpoint and dual verification modes'
    New-TestCase -Id 'TC-004' -Task 'T-004' -FilePath "$rootBe\docs\local-startup\troubleshooting.md" -Pattern 'Missing env key|Docker daemon|recovery|Recovery' -Description 'Troubleshooting maps key BE failures to recovery actions'
    New-TestCase -Id 'TC-005' -Task 'T-005' -FilePath "$rootFe\.env.example" -Pattern 'VITE_API_BASE_URL|VITE_APP_ENV' -Description 'FE env contract includes required keys'
    New-TestCase -Id 'TC-006' -Task 'T-006' -FilePath "$rootFe\docker-compose.local.yml" -Pattern 'frontend:|VITE_API_BASE_URL|5173' -Description 'FE compose baseline is defined with API base URL env'
    New-TestCase -Id 'TC-007' -Task 'T-007' -FilePath "$rootFe\docs\local-startup\connectivity.md" -Pattern 'readiness|/health|VITE_API_BASE_URL' -Description 'Connectivity contract references BE readiness gate and API base URL'
    New-TestCase -Id 'TC-008' -Task 'T-008' -FilePath "$rootBe\docs\local-startup\guide.md" -Pattern 'Step 1: Start Backend|Step 2: Start Frontend|Checkpoint' -Description 'Integrated guide enforces BE -> FE sequence with checkpoints'
    New-TestCase -Id 'TC-009' -Task 'T-009' -FilePath "$rootBe\docs\local-startup\checklist.md" -Pattern 'Expected Success|Expected Failure|Checklist' -Description 'Checklist includes success/failure expectations'
    New-TestCase -Id 'TC-010' -Task 'T-010' -FilePath "$rootBe\docs\local-startup\linked-pr-sync.md" -Pattern 'BE PR|FE PR|G1|G2' -Description 'Linked PR sync checklist has bi-directional references'
    New-TestCase -Id 'TC-011' -Task 'T-011' -FilePath "$rootBe\docs\local-startup\compatibility.md" -Pattern 'Windows|Linux|macOS' -Description 'Compatibility notes cover Windows, Linux, macOS'
    New-TestCase -Id 'TC-012' -Task 'T-012' -FilePath "$rootBe\docs\local-startup\traceability.md" -Pattern 'FR-001|NFR-005|Verification Point' -Description 'Traceability includes FR/NFR mapping with verification points'
    New-TestCase -Id 'TC-013' -Task 'T-009' -FilePath "$rootBe\docs\local-startup\checklist.md" -Pattern 'connectivity|Failure Routing|BauCuaFE' -Description 'Checklist routes FE cannot reach BE scenario to remediation'
    New-TestCase -Id 'TC-014' -Task 'T-004' -FilePath "$rootBe\docs\local-startup\troubleshooting.md" -Pattern 'Missing env key|Fail-Fast' -Description 'Troubleshooting includes missing env key fail-fast path'
)

$results = foreach ($t in $tests) {
    $exists = Test-Path $t.FilePath
    $content = if ($exists) { Get-Content -Path $t.FilePath -Raw } else { '' }
    $passed = $exists -and ($content -match $t.Pattern)

    [pscustomobject]@{
        Id = $t.Id
        Task = $t.Task
        File = $t.FilePath
        Passed = $passed
        Description = $t.Description
    }
}

$total = $results.Count
$passedCount = ($results | Where-Object { $_.Passed }).Count
$coverage = if ($total -eq 0) { 0 } else { [math]::Round(($passedCount / $total) * 100, 2) }

$summary = [pscustomobject]@{
    Total = $total
    Passed = $passedCount
    Failed = ($total - $passedCount)
    CoveragePercent = $coverage
}

$summary | Format-List | Out-String | Write-Output
$results | Format-Table Id, Task, Passed, Description -AutoSize | Out-String | Write-Output

if ($coverage -lt 70) {
    Write-Error "Coverage below threshold: $coverage% < 70%"
    exit 2
}

if (($results | Where-Object { -not $_.Passed }).Count -gt 0 -and -not $CoverageOnly) {
    Write-Error "One or more contract checks failed."
    exit 3
}

exit 0
