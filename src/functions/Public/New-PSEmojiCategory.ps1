<#
.SYNOPSIS
    Creates a new emoji category.

.DESCRIPTION
    Adds a new master property to UnicodeJson.json file.

.PARAMETER Name
    Provides a new emoji category name.

.EXAMPLE
    New-PSEmojiCategory -Name space
    This command will create a new emoji category of name 'space'.

.NOTES
    Author: Felipe de Souza Santos
    Date: 07/26/2020
#>
function New-PSEmojiCategory {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [ValidateScript({
            $PSEMOJI.emojis.psobject.properties.name -notcontains $PSItem
        })]
        [string]$Name
    )
    BEGIN {        
        $unicode = Get-Content $UNICODE_JSON | ConvertFrom-Json        
        $setContent = @{
            Path  = $null
            Value = $null
            Force = $true
        }        
        $params = @{
            MemberType  = 'NoteProperty'
            InputObject = $unicode
            Name        = $Name
            Value       = [pscustomobject]@{}
            Force       = $true
        }
        $output = [pscustomobject]@{
            category       = $Name
            category_added = $false
        }  
    }
    PROCESS {
        try {
            Add-Member @params
        }
        catch { throw }
        try {
            $setContent.Path = $UNICODE_JSON   
            $setContent.Value = $unicode | ConvertTo-Json
            Set-Content @setContent
            $output.category_added = $true
        }        
        catch { throw }
    }
    END {
        Write-Output $output
        return $($PSEMOJI.refresh())
    }
}