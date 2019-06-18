function Get-SRBinaryChoice {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]  [String]       $Prompt,
         [Parameter(Mandatory=$false, Position=1)] [ConsoleColor] $PromptColor = $SRDisplayUtilities_PrimaryColor,

         [Parameter(Mandatory=$false, Position=2)] [Switch]       $ClearScreen
    )

    Show-SRTitle -SubTitle "$Prompt [y/n]:" -SubTitleColor $PromptColor -SubTitleMargin 0 -ClearScreen:$ClearScreen
    $answer = Read-Host
    while($answer -ne 'n')
    {
        if ($answer -eq 'y')
        {
            return $true
        }
        Show-SRTitle -SubTitle "$Prompt [y/n]:" -SubTitleColor $PromptColor -SubTitleMargin 0 -ClearScreen:$ClearScreen
        $answer = Read-Host
    }
    return $false
}