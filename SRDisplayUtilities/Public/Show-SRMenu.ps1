function Show-SRMenu {
    Param
    (
        [Parameter(Mandatory=$false, Position=0)] [String]       $Title         = "Menu",
        [Parameter(Mandatory=$false, Position=1)] [ConsoleColor] $TitleColor    = $SRDisplayUtilities_PrimaryColor,

        [Parameter(Mandatory=$false, Position=2)] [String]       $SubTitle      = "",
        [Parameter(Mandatory=$false, Position=3)] [ConsoleColor] $SubTitleColor = $SRDisplayUtilities_SecondaryColor,

        [Parameter(Mandatory=$true,  Position=4)] [String[]]     $Options,
        [Parameter(Mandatory=$false, Position=5)] [ConsoleColor] $OptionsColor  = $SRDisplayUtilities_SecondaryColor,

        [Parameter(Mandatory=$false, Position=6)] [Switch]       $CanQuit,
        [Parameter(Mandatory=$false, Position=7)] [Switch]       $ClearScreen
    )

    Show-SRTitle -Title $Title -TitleColor $TitleColor -SubTitle $SubTitle -SubTitleColor $SubTitleColor -Offset 2 -ClearScreen:$ClearScreen

    $i = 1
    Foreach ($Opt in $Options) {
        Write-Host "$($i): $Opt" -ForegroundColor $OptionsColor
        $i++
    }

    If ($CanQuit.IsPresent) {
        Write-Host "Q: Exit" -ForegroundColor $OptionsColor
    }
    
    Write-host ""

    Write-Host "Input:" -NoNewline -ForegroundColor $SRDisplayUtilities_PrimaryColor

    $ret = Read-Host

    if ($CanQuit.IsPresent -and $ret -like 'q') {
        return 0
    } else {
        try   { $ret = [int]$ret }
        catch { $ret = -1 }
    }
    if ($ret -eq 0) {
        $ret = -1
    }
    return $ret
}