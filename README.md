#Microsoft IIS 10 CIS Benchmark PowerShell commands 

This is an attempt to use PowerShell cmdlets form IISAdministration (and from new WebAdministration module if needed) for the benchmark audit and remediation recommendations. 

Use the following comands to find out a lis of cmdlets supported by each module:

```powershell
#use thes cmdlets
Get-Command -Module ISSAdministration
#Try to avoid 
Get-Command -Module WebAdministration
```
Join [CIS Microsoft IIS Security Benchmarks Community](https://workbench.cisecurity.org/communities/5)
