# Install Azure PowerShell module if not already installed
# Install-Module -Name Az -AllowClobber -Scope CurrentUser
<#
.Notes
Author: Nithin K

Last Modified: 2024-003-20
Changes:
- Initial version.

.Synopsis
Fatch Metadata of VM

.Description
Fatch Metadata of VM

#>

Param(
    
    [Parameter(Mandatory=$true,Position=0)]
    [string]$ResourceGroupName,
    [Parameter(Mandatory=$true,Position=1)]
    [string]$vmname,
    [Parameter(Mandatory=$true,Position=1)]
    [string]$key

)

Begin {
    Write-Output "Script started working"
}

Process {
    try{    
            #Use below command to install the Az module if not already installed and manual login.
            #If not can use SP to login via pipeline tasks and pass the variable.
            
            # Import the Az module
            #Import-Module Az

            # Connect to Azure account (sign in interactively)
            #Connect-AzAccount

            # Specify the resource group and VM name
            $resourceGroupName = $ResourceGroupName
            $vmName = $vmname

            # Get VM metadata
            $vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

            # Extract relevant metadata
            $metadata = @{
            'VMName' = $vm.Name
            'Location' = $vm.Location
            'ResourceGroupName' = $vm.ResourceGroupName
            'OS' = $vm.StorageProfile.OsDisk.OsType
            'VMSize' = $vm.HardwareProfile.VmSize
            'PublicIpAddress' = $vm.PublicIpAddress
        }
        if ($key) {

            foreach ($line in $metadata) {
                $output = $line.$key
                $output = $output | ConvertTo-Json 
                Write-Output $output
            }
        else
            {
                Write-Output "Key is Empty"
            }
        }     
            # Convert metadata to JSON format
            $jsonOutput = $metadata | ConvertTo-Json -Depth 10

            # Output JSON
            Write-Output $jsonOutput
        }
        catch
        {
            Write-output "Unexpected error: {0}" -f $_.Exception.Message;
        }
    }
    
    End {
        Write-Output "Script finished working"
    }