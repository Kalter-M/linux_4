{
	if (match($0, /([0-9]{1,3}\.){3}[0-9]{1,3}/, ip)) {
		if(match($0, /[a-zA-Z]{3}\s{1,2}[0-9]{1,2}\s[0-9]{2}:[0-9]{2}:[0-9]{2}/, date)) {
			if(ips[ip[0]] == "") {
				ips[ip[0]]="e"
				ip_first[ip[0]]=date[0]
			}
			ip_last[ip[0]]=date[0]
		}
	}
}
END {
	asorti(ips, sorted)
	for(i in sorted) {
		print "IP is: " sorted[i] "\nFirst: " ip_first[sorted[i]] "\nLast: "ip_last[sorted[i]] "\n"
		system("echo '\\hline' >> out.tex")
		content = sorted[i] " & " ip_first[sorted[i]] " & " ip_last[sorted[i]] " \\\\\\\\"
		echo="echo \'"content"\' >> out.tex"
		system(echo)
	}
}
