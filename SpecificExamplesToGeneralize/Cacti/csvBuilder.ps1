$gawkScriptPath = "./../csvBuilder.awk";

$origin = pwd;
cd $targetFolder;

$files = gci -Recurse -Filter "*.txt";
$gawkInput;

foreach($file in $files)
{
    $gawkInput += "FILE_START`n";
    $gawkInput += ( Get-Content $file.FullName | Out-String);
    $gawkInput += "FILE_END`n";
}

$gawkInput | gawk -f $gawkScriptPath;
cd $origin;
