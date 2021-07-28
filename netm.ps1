while($true)
{
 
$a = Get-NetAdapterStatistics
$r1 = $a.ReceivedBytes
$s1 = $a.SentBytes
sleep 1
$a = Get-NetAdapterStatistics
$r2 = $a.ReceivedBytes
$s2 = $a.SentBytes
 
$rt = ($r2 - $r1) /1024
$st = ($s2 - $s1) /1024
 
$totr = $r1 /1024 /1024
$tots = $s1 /1024 /1024
 
$res1 = [math]::Round($totr,2)
$res2 = [math]::Round($tots,2)
$sf = [math]::Round($st,2)
 
        if ($rt -lt 1024)
{$rtf = [math]::Round($rt,2); write-progress "$rtf KB/s Down $sf KB/s Up Received/Sent: $res1 MB/$res2 MB"}
else
 
{$f = $rt /1024;$rtf = [math]::Round($f,2);write-progress "$rtf MB/s Down $sf KB/s Up Received/Sent:  $res1 MB/$res2 MB"}
 
}
