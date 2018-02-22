# Microsoft IIS 10 CIS Benchmark verification and remediation PowerShell scripts 

This is an attempt to develop verification and remediation scripts for the [CIS IIS Security Benchmark](https://www.cisecurity.org/benchmark/microsoft_iis/) audit and remediation recommendations using PowerShell cmdlets from the WebAdministration module (and from the new IISAdministration module only if needed) . 

Use the following commands to find out a list of cmdlets supported by each module:

```powershell
#use these cmdlets
Get-Command -Module WebAdministration
#Try to avoid 
Get-Command -Module IISAdministration
```
Join [CIS Microsoft IIS Security Benchmarks Community](https://workbench.cisecurity.org/)

## Useful links

Articles:
* [PowerShell script generation in IIS Configuration Editor](https://blogs.iis.net/wonyoo/powershell-script-generation-in-iis-configuration-editor)

Powershell trainings available online for free on [Microsoft Virtual Academy](https://mva.microsoft.com/training-topics/powershell#!jobf=IT%20Professional&lang=1033) featuring PowerShell creator Jeffrey Snover. The cources are a bit aged, but still good and relevant:
* [Getting Started with PowerShell 3.0 Jump Start](https://mva.microsoft.com/en-US/training-courses/getting-started-with-powershell-30-jump-start-8276)
* [Advanced Tools & Scripting with PowerShell 3.0 Jump Start](https://mva.microsoft.com/en-US/training-courses/advanced-tools-scripting-with-powershell-30-jump-start-8277)
