function getSubnetRange($IP, $netmask)
\{
	$IPBinary = [string]::join(".",($ip.split(".") | % {[System.Convert]::ToString($IP,2).PadLeft(8,"0")}))						# convert the IP address to binary
	$netmaskBinary = [string]::join(".",($ip.split(".") | % {[System.Convert]::ToString($NetMask,2).PadLeft(8,"0")}))			# convert the NetMask to binary
	
	$networkAddress = (IPBinary -and netmaskBinary)																				# the bottom end of the range
	
	$range = -Not netmaskBinary																									# the size of the range
	
	$upperEndNetworkAddress = networkAddress + range																			# the upper limit of the range
	
	$networkAddress = [string]::join(".",($sbin.split(".") | % {[System.Convert]::ToByte($networkAddress,2)}))					# convert the lower limit back to decimal
	$upperEndNetworkAddress = [string]::join(".",($sbin.split(".") | % {[System.Convert]::ToByte($upperEndNetworkAddress,2)}))	# convert the upper limit back to binary

	
	$arr = networkAddress, upperEndNetworkAddress
	
	return $arr																													# returns the two IP adresses	
	
\}