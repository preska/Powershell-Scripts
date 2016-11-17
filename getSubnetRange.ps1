function binaryAND ($num1, $num2)
{   
	$andResult = (0..31)

	for ($i = 0; $i -le $num1.length; $i++)
	{
		if($num1[$i] -and $num2[$i])
		{
			$andResult[$i] = 1
		}
		else
		{
			$andResult[$i] = 0
		}
	}
    return $andResult
}

function toBinary ($dottedDecimal)
{ 
	$dottedDecimal.split(".") | ForEach-Object {$binary=$binary + $([convert]::toString($_,2).padleft(8,"0"))} 
	return $binary 
} 

function toDottedDecimal ($binary)
{ 
	do {$dottedDecimal += "." + [string]$([convert]::toInt32($binary.substring($i,8),2)); $i+=8 } while ($i -le 24) 
	return $dottedDecimal.substring(1) 
} 

function getSubnetRange($IP, $netmask)
{
	# to binary
	$IPBinary = toBinary -dottedDecimal $IP
	$netmaskBinary = toBinary -dottedDecimal $netmask
	
	# TEST
	write-host $IPBinary
	write-host $netmaskBinary
	$test = binaryAND -num1 $IPBinary -num2 $netmaskBinary
	write-host $test

	$networkAddress = ($IPBinary -and $netmaskBinary)		# the bottom end of the range
	
	$range = -Not ($netmaskBinary)							# the size of the range
	
	$upperEndNetworkAddress = $networkAddress + $range		# the upper limit of the range
	
	# to decimal
	$networkAddress = toDottedDecimal -binary networkAddress
	$upperEndNetworkAddress = toDottedDecimal -binary upperEndNetworkAddress

	$arr = $networkAddress, $upperEndNetworkAddress

	Write-host $("$arr")
	#return $arr
}

getSubnetRange -IP "216.3.128.12" -netmask "255.255.255.0"
