$target = "E:\Users\Raffaele\Desktop\test";
$executionTarget = "E:\Users\Raffaele\Documents\GitHub\HandyPowershell\executorTest\executionTarget.ps1";
$numFiles = 30;
$nPar = 5;
$sleepTime = 3;

$expressions = New-Object System.Collections.ArrayList;

foreach( $i in (1..$numFiles) )
{
	$filename = ( -join ((65..90) | Get-Random -Count 5 | % {[char]$_}) ) + ".txt";
	$expressions.Add("$executionTarget -pwd $target -filename $filename -sleepTime $sleepTime") | Out-Null;
}

E:\Users\Raffaele\Documents\GitHub\HandyPowershell\expressionsExecutor.ps1 -nParallelJobs $nPar -expressions $expressions;