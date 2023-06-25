#!/usr/bin/awk -f

# dpkg-diff.awk - compare and print differencies in the installed packages of two dpkg status files
# by xmb - localhack
# xmb@skilled.com

# status in the array:
# 1 = installed in the reference file, but not in the other one
# 2 = both matching
# 3 = newly intsalled on the other status file
# decided to use additionally a plain index for faster processing of the END block

# Changes by Justin Maggard (justin.maggard@netgear.com)
# 2010/05/27:
# * Don't print out anything except control data present in the reference file and not in the other file
# * Remove some unused functionality

BEGIN {
	if (! status) status = "/var/lib/dpkg/status"
	
	if (ARGC <= 1 && ! stdin) {
		exit 1
	}
	
	while (getline < status) {
		if ($1 == "Package:") {
			pkg = $2
		}
		else if ($1 == "Architecture:") {
			if (pkg != "readynasos") {
				pkg = pkg ":" $2
				Package[pkg] = 1
			}
		}
	} close(status)
}

$1 == "Package:" {
	pkg = $2
	if (! valid_file)
		valid_file = 1
}
$1 == "Architecture:" {
	pkg = pkg ":" $2
	if (Package[pkg])
		delete Package[pkg]
}

END {
	if (! valid_file) {
		exit 1
	}
	
	while (getline < status) {
		if ($1 == "Package:") {
			pkg = $2
			if (printit)
				print tmp
			tmp = ""
			printit = 0
		}
		else if ($1 == "Architecture:") {
			pkg = pkg ":" $2
			if (Package[pkg])
				printit = 1
		}
		if ($1)
			tmp = tmp $0 "\n"
	} close (status)
	if (printit)
		print tmp
}
