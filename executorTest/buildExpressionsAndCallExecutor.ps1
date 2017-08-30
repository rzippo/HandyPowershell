$targetFolder = "~\Desktop";
$executionTarget = ".\executionTarget.ps1";
$numFiles = 30;
$nParallelJobs = 5;
$sleepTime = 3;

$expressions = New-Object System.Collections.ArrayList;
$executionTargetFullPath = (gci $executionTarget).FullName;

foreach( $i in (1..$numFiles) )
{
	$filename = ( -join ((65..90) | Get-Random -Count 5 | % {[char]$_}) ) + ".txt";
	$expressions.Add("$executionTargetFullPath -targetFolder $targetFolder -filename $filename -sleepTime $sleepTime") | Out-Null;
}

Execute-Expressions -nParallelJobs $nParallelJobs -expressions $expressions;
