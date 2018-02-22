#Microsoft IIS 10 CIS Benchmark PowerShell commands 

This is an attempt to use PowerShell cmdlets form WebAdministration (and from new IISAdministration module only if needed) for the benchmark audit and remediation recommendations. 

Use the following commands to find out a list of cmdlets supported by each module:

```powershell
#use these cmdlets
Get-Command -Module WebAdministration
#Try to avoid 
Get-Command -Module IISAdministration
```
Join [CIS Microsoft IIS Security Benchmarks Community](https://workbench.cisecurity.org/communities/5)
