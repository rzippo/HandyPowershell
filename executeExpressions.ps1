param(
	[Int32]$nParallelJobs = 8,
	[parameter(Mandatory=$true)][System.Collections.ArrayList]$expressions
)

#$expressionsToRun = New-Object System.Collections.ArrayList;
#$expressionsToRun.AddRange($expressions);

while( $expressions.Count -gt 0 )
{
	$runningJobs = @(Get-Job | Where-Object { $_.State -eq 'Running' });
	while( $runningJobs.Count -lt $nParallelJobs -and $expressions.Count -gt 0)
	{
		$nextExpression = $expressions[0];
		$expressions.RemoveAt(0);

		Start-Job -ScriptBlock {Invoke-Expression $args[0]} -ArgumentList $nextExpression;
		$runningJobs = @(Get-Job | Where-Object { $_.State -eq 'Running' });
	}

	$runningJobs | Wait-Job -Any;
}
Get-Job | Wait-Job;