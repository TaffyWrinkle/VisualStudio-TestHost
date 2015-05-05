function GetWix {
    param($target)

    Write-Output "Downloading Wix to $target"

    $file = [IO.Path]::GetTempFileName()
    del $file
    $file += ".zip"
    Write-Output "  - temporary storage: $file"

    Invoke-WebRequest "https://wix.codeplex.com/downloads/get/1421697" -UseBasicParsing -OutFile $file

    $shell = New-Object -COM Shell.Application
    $dest = $shell.NameSpace("$target")
    $shell.NameSpace("$file").items() | %{ $dest.CopyHere($_) }

    del $file
}
