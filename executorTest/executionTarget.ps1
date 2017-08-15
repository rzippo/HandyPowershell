param(
	[string]$pwd,
	[string]$filename,
	[Int32]$sleepTime
)

Start-Sleep -s $sleepTime;
cd $pwd;
"You know, stuff." | Out-File -FilePath $filename;