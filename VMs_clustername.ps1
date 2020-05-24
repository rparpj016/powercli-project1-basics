###VM count by clustername. ###

#Synopsis 
#Date : 30/03/2020
#Author : Roshan
#Modified by : Roshan
# This script will list the VM counts by cluster name.

#Connect to the Virtual centre uses passord from encrypted file
Connect-VIServer -Server 10.125.1.10 -Credential (Import-Clixml -Path D:\Scripts\VMcount\pass\AMS\cred.xml)

Get-Cluster | Select Name, @{N="Host Count"; E={($_ | Get-VMHost).Count}},  @{N="VM Count"; E={($_ | Get-VM).Count}} | export-csv "D:\Scripts\VMcount\vc_capacity_$vc.csv" 
#Disconnect from Virtual centre
Disconnect-VIServer -Server * -Force -Confirm:$false


### End of Script###