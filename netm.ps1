while($true)
{

$r1 = (wmic path Win32_PerfRawData_Tcpip_NetworkInterface get BytesReceivedPersec) -replace "[^0-9]" , ''
$s1 = (wmic path Win32_PerfRawData_Tcpip_NetworkInterface get BytesSentPersec) -replace "[^0-9]" , ''
sleep 1
$r2 = (wmic path Win32_PerfRawData_Tcpip_NetworkInterface get BytesReceivedPersec) -replace "[^0-9]" , ''
$s2 = (wmic path Win32_PerfRawData_Tcpip_NetworkInterface get BytesSentPersec) -replace "[^0-9]" , ''


$rt = [math]::Round((("$r2" - "$r1") /1024),2) 
$st = [math]::Round((("$s2" - "$s1") /1024),2)

$rtm = [math]::Round((("$rt") /1024),2)
$stm = [math]::Round((("$st") /1024),2)


$trm = [math]::Round(("$r1" /1024 /1024),2)
$tsm = [math]::Round(("$s1" /1024 /1024),2)

$trg = [math]::Round(("$r1" /1024 /1024 /1024),2)
$tsg = [math]::Round(("$s1" /1024 /1024 /1024),2)


 
	if (($rt -lt 1024) -and ($st -lt 1024))
{ if (($trm -gt 1024) -and ($tsm -gt 1024)) {write-progress "$rt KB/s Down $st KB/s Up Received/Sent: $trg GB/$tsg GB"} elseif ($trm -gt 1024) {write-progress "$rt KB/s Down $st KB/s Up Received/Sent: $trg GB/$tsm MB"}  elseif ($tsm -gt 1024) {write-progress "$rt KB/s Down $st KB/s Up Received/Sent: $trm MB/$tsg GB"} else {write-progress "$rt KB/s Down $st KB/s Up Received/Sent: $trm MB/$tsm MB"} }

	else
 
{ if (($trm -gt 1024) -and ($tsm -gt 1024)) {write-progress "$rtm MB/s Down $stm MB/s Up Received/Sent: $trg GB/$tsg GB"} elseif ($trm -gt 1024) {write-progress "$rtm MB/s Down $stm MB/s Up Received/Sent: $trg GB/$tsm MB"}  elseif ($tsm -gt 1024) {write-progress "$rtm MB/s Down $stm MB/s Up Received/Sent: $trm MB/$tsg GB"} else {write-progress "$rtm MB/s Down $rts MB/s Up Received/Sent: $trm MB/$tsm MB"} }

 
}
