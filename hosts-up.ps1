################################################################################
# Powershell script to test if a range of IPs are active
################################################################################

# Create a new Ping object
$ping = New-Object System.Net.NetworkInformation.Ping

# Log file date time
$LogTime = Get-Date -Format "dd-MM-yyyy_hh-mm-ss"

# Log file path
$path = "C:\HostsLog\"

# Log file
$LogFile = $path + "hosts-" + $LogTime + ".csv"

# Verify that our path exists
if ([IO.Directory]::Exists($path)){
	# Do nothing if it exists
} else {
	# Create the directory
	New-Item -ItemType directory -Path C:\HostsLog | Out-Null
}

# Append header log file
out-file -filepath $LogFile -inputobject "timestamp,ip,status"

# Loop through IP range
1..255 | foreach {
    # Set ip address range to ping
    # Change this to your liking, note the $_ variable 
    $ip = "10.0.0.$_"

    # Current date and time
    $date = Get-Date -UFormat %c

    # Send ping
    $response = $ping.send($ip)

    # Get the status of the pinged host
    if ($response.Status -eq "Success") {
        $ipstatus = "$date,$ip,UP"
    } else {
        $ipstatus = "$date,$ip,DOWN"
    }

    # Append to log file
    Add-content $LogFile $ipstatus
}
