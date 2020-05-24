###VM count by hostname. ###

#Synopsis 
#Date : 30/03/2020
#Author : Rafeekh
#Modified by : Rafeekh
# This script will list the VM counts by host name.

#Connect to the Virtual centre uses passord from encrypted file
Connect-VIServer -Server 10.125.1.10 -Credential (Import-Clixml -Path D:\Scripts\VMcount\pass\AMS\cred.xml)
Get-VMHost | Select @{N=“Cluster“;E={Get-Cluster -VMHost $_}}, Name, @{N=“NumVM“;E={($_ | Get-VM).Count}} | Sort Cluster, Name | Export-Csv -NoTypeInformation D:\Scripts\VMcount\clu-host-numvm.csv 

#Disconnect from Virtual centre
Disconnect-VIServer -Server * -Force -Confirm:$false


### End of Script###