param(
	[string]$targetFolder,
	[string]$filename,
	[Int32]$sleepTime
)

Start-Sleep -s $sleepTime;
cd (Get-Item $targetFolder).FullName;
"You know, stuff." | Out-File -FilePath $filename;
