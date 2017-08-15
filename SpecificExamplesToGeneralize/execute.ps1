# CONFIGURATION
    $executablePath = "~/CA_Cache/cacti/cacti65";
    $targetFolder = "~/CA_Cache/cacti/configs-65"

    $cfgFilter = "*.cfg";
    $outExtension = ".txt";

# EXECUTION

	cd $targetFolder;

    $cfgs = Get-ChildItem -Recurse -Filter ( $cfgFilter );

    $root = pwd;
    $progressCounter = 1;

    foreach( $cfg in $cfgs )
    {
        Write-Host ( "Processing " + $progressCounter + " out of " + $cfgs.length + "...");

        cd $cfg.DirectoryName
        $expression = $executablePath + ' -infile ' + $cfg.FullName + ' > ' + ( $cfg.Name + $outExtension );
        Invoke-Expression $expression;

        $progressCounter++;
    }

    cd $root;
