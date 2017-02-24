#
# IIS 10 CIS Becnchmark
# IIS on Windows server 2016, Windows 10
#

# Import-Module Webadministration 

#

#region 1 Basic Configurations	10

#region	1.1 Ensure web content is on non-system partition (Scored)
#   Audit, look at Physical Path
# C:\Windows\System32\inetsrv>appcmd.exe list vdir
Get-Website
#   Remediation,TODO New-Item -Path -ItemType Directory; Copy-Item -Path -Destination -Recurse;

#endregion

#region	1.2 Ensure 'host headers' are on all sites (Scored)
#   Audit, %systemroot%\system32\inetsrv\appcmd list sites
#look at Binding mappings, TODO
Get-Website
#Get-WebBinding -HostHeader test.com
#Get-WebBinding -Name test1
#   Remediation
New-WebBinding -Name test1 -Port 80 -HostHeader test1.com
#endregion

#region	1.3 Ensure 'directory browsing' is set to disabled (Scored)
#   Audit, 
# appcmd list config /section:directoryBrowse

#   Remediation,TODO 

#endregion

#region	1.4 Ensure 'application pool identity' is configured for all application pools (Scored)
#   Audit, TODO
Get-ItemProperty -Path 'IIS:\Sites\Default Web Site' -Name applicationPool -Value uniqueAppPool
Get-ItemProperty -Path 'IIS:\Sites\Default Web Site'  |select applicationpool | gm
#   Remediation,TODO  

#endregion

#region	1.5 Ensure 'unique application pools' is set for sites (Scored)
#   Audit
#   Get-Unique -> check for unique combination of ste names and AppPool names?
Get-Website | select Name, applicationPool
#   Remediation,TODO 
#Get-WebAppPoolState | gm
Get-childItem -Path IIS:\AppPools
New-WebAppPool -Name applicationPool1
Set-ItemProperty -Path 'IIS:\Sites\Default Web Site' -Name applicationPool -Value applicationPool1
#endregion

#region	1.6 Ensure 'application pool identity' is configured for anonymous user identity (Scored)
#   Audit, TODO
Get-ChildItem -Path IIS:\AppPools |ft -Property Name, passAnonymousToken
#Get-WebConfiguration -filter system.webserver/urlcompression -PSPath iis:\
#   Remediation,TODO 
Set-ItemProperty -Path IIS:\AppPools\DefaultAppPool -Name passAnonymousToken -Value True
#endregion

#endregion 


#region 2 Configure Authentication and Authorization

# Get-WebConfiguration -filter system.webServer/security/authentication/* -PSPath iis:\ -Recurse | where {$_.enabled -eq $true} | format-list
#	2.1 Ensure 'global authorization rule' is set to restrict access (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.2 Ensure access to sensitive site features is restricted to authenticated principals only (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.3 Ensure 'forms authentication' require SSL (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.4 Ensure 'forms authentication' is set to use cookies (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.5 Ensure 'cookie protection mode' is configured for forms authentication (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.6 Ensure transport layer security for 'basic authentication' is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.7 Ensure 'passwordFormat' is not set to clear (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	2.8 Ensure 'credentials' are not stored in configuration files (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#endregion


#region 3 ASP.NET Configuration Recommendations
#	3.1 Ensure 'deployment method retail' is set (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.2 Ensure 'debug' is turned off (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.3 Ensure custom error messages are not off (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.4 Ensure IIS HTTP detailed errors are hidden from displaying remotely (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.5 Ensure ASP.NET stack tracing is not enabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.6 Ensure 'httpcookie' mode is configured for session state (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.7 Ensure 'cookies' are set with HttpOnly attribute (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.8 Ensure 'MachineKey validation method - .Net 3.5' is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.9 Ensure 'MachineKey validation method - .Net 4.5' is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.10 Ensure global .NET trust level is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	3.11 Ensure 'encryption providers' are locked down (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#endregion


#region 4 Request Filtering and Other Restriction Modules
#	4.1 Ensure 'maxAllowedContentLength' is configured (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.2 Ensure 'maxURL request filter' is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.3 Ensure 'MaxQueryString request filter' is configured (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.4 Ensure non-ASCII characters in URLs are not allowed (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.5 Ensure Double-Encoded requests will be rejected (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.6 Ensure 'HTTP Trace Method' is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.7 Ensure Unlisted File Extensions are not allowed (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.8 Ensure Handler is not granted Write and Script/Execute (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.9 Ensure 'notListedIsapisAllowed' is set to false (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.10 Ensure 'notListedCgisAllowed' is set to false (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	4.11 Ensure 'Dynamic IP Address Restrictions' is enabled (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#endregion


#region 5 IIS Logging Recommendations
#	5.1 Ensure Default IIS web log location is moved (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	5.2 Ensure Advanced IIS logging is enabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	5.3 Ensure 'ETW Logging' is enabled (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#endregion


#region 6 FTP Requests
#	6.1 Ensure FTP requests are encrypted (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	6.2 Ensure FTP Logon attempt restrictions is enabled (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#endregion


#region 7 Transport Encryption
#	7.1 Ensure HSTS Header is set (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.2 Ensure SSLv2 is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.3 Ensure SSLv3 is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.4 Ensure TLS 1.0 is disabled (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.5 Ensure TLS 1.1 is enabled (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.6 Ensure TLS 1.2 is enabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.7 Ensure NULL Cipher Suites is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.8 Ensure DES Cipher Suites is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.9 Ensure RC2 Cipher Suites is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.10 Ensure RC4 Cipher Suites is disabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.11 Ensure Triple DES Cipher Suite is configured (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.12 Ensure AES 128/128 Cipher Suite is configured (Not Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.13 Ensure AES 256/256 Cipher Suite is enabled (Scored)
#   Audit, TODO

#   Remediation,TODO 

#
#	7.14 Ensure TLS Cipher Suite ordering is configured (Scored)
#   Audit, TODO
#   List available cyphers
(get-item HKLM:\SYSTEM\CurrentControlSet\Control\Cryptography\Configuration\Local\SSL\00010002\).getvalue('Functions')
#or
Get-TlsCipherSuite | Format-Table -Property Name
#   Remediation,TODO 

#
#endregion


#	Test Data