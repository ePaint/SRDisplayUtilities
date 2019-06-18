function Get-SRMultipleChoice {
    Param
    (
        [Parameter(Mandatory=$true,  Position=0)] [String[]]     $Choices,
        [Parameter(Mandatory=$false, Position=1)] [ConsoleColor] $ChoicesColor     = $SRDisplayUtilities_SecondaryColor,

        [Parameter(Mandatory=$false, Position=2)] [String]       $Prompt           = "Input",
        [Parameter(Mandatory=$false, Position=3)] [ConsoleColor] $PromptColor      = $SRDisplayUtilities_PrimaryColor,

        [Parameter(Mandatory=$false, Position=4)] [String]       $ErrorPrompt      = "Invalid input",
        [Parameter(Mandatory=$false, Position=5)] [ConsoleColor] $ErrorPromptColor = $SRDisplayUtilities_ErrorColor,

        [Parameter(Mandatory=$false, Position=6)] [Switch]       $CanQuit,
        [Parameter(Mandatory=$false, Position=7)] [Switch]       $ClearScreen
    )
    
    If ($Choices.Length -eq 1) {
        try {
            return $Choices[0]
        }
        catch {
            Write-Host "Empty input array" -ForegroundColor $SRDisplayUtilities_ErrorColor
            pause
            return $null
        }
    }
    else {
        while ($true) {

            $Chosen = Show-SRMenu -Title $Prompt -TitleColor $PromptColor `
                                  -SubTitle $SubTitle -SubTitleColor $ErrorPromptColor `
                                  -Options $Choices -OptionsColor $ChoicesColor `
                                  -CanQuit:$CanQuit -ClearScreen:$ClearScreen
            if ($Chosen | Test-SRIsInteger) {
                if (!$Chosen) {
                    return $false
                }
                elseif ($Chosen -gt 0 -and $Chosen -le $Choices.Length) {
                    return $Choices[$Chosen - 1]
                }
            }

            $SubTitle = $ErrorPrompt            
        }
    }
}