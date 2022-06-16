Write-Output "Retrieving Fengari-Web"
$FengariRepo = "https://github.com/fengari-lua/fengari-web"
$FengariVersion = "v0.1.4"
$Fengari = @(
    "${FengariRepo}/releases/download/${FengariVersion}/fengari-web.js",
    "${FengariRepo}/releases/download/${FengariVersion}/fengari-web.js.map"
)

$Fengari | Foreach-Object -ThrottleLimit 5 -Parallel {
    $filename = $(Split-Path $_ -Leaf)
    Write-Output "  ${filename}..."
    Invoke-WebRequest $_ -OutFile ".\bin\${filename}"
} -AsJob | Receive-Job -Wait

Write-Output "Installing Haxelibs"
haxelib install all
