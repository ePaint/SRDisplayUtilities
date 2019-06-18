function Show-SRTitle {
    Param
    (
        [Parameter(Mandatory=$false, Position=0)] [String]       $Title          = "",
        [Parameter(Mandatory=$false, Position=1)] [ConsoleColor] $TitleColor     = $SRDisplayUtilities_PrimaryColor,
        [Parameter(Mandatory=$false, Position=0)] [int]          $TitleMargin    = 32,

        [Parameter(Mandatory=$false, Position=2)] [String]       $SubTitle       = "",
        [Parameter(Mandatory=$false, Position=3)] [ConsoleColor] $SubTitleColor  = $SRDisplayUtilities_SecondaryColor,
        [Parameter(Mandatory=$false, Position=0)] [int]          $SubTitleMargin = 32,

        [Parameter(Mandatory=$false, Position=4)] [String]       $Offset         = 0,
        [Parameter(Mandatory=$false, Position=5)] [Switch]       $ClearScreen
    )
    if ($ClearScreen.IsPresent) {
        Clear-Host
        Start-Sleep -Milliseconds 50
    }

    if ($Title -notlike "") {
        $TitleMargin = $TitleMargin - [math]::Floor(($Title.Length / 2)) - 1
        if ($TitleMargin -gt 0) {
            $Title = "=" * $TitleMargin + " " + $Title + " " + "=" * ($TitleMargin - $Prompt.Length % 2)
        }
    Write-Host $Title -ForegroundColor $TitleColor
    $Offset = $Offset - 1
    }

    if ($SubTitle -notlike "") {
        $SubTitleMargin = $SubTitleMargin - [math]::Floor(($SubTitle.Length / 2))
        if ($SubTitleMargin -gt 0) {
            $SubTitle = " " * $SubTitleMargin + $SubTitle
        }
        Write-Host $SubTitle -NoNewline -ForegroundColor $SubTitleColor
    }

    for ($i=0; $i -lt $Offset; $i++) { Write-Host "" }
}