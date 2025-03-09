# Making a list of sevrers to ping
servers=(google.com iith.ac.in boredhumans.com youtube.eu)

# Iterating through the list and pinging
for server in ${servers[@]}
do
	echo "Pinging $server.."
	ping -c 3 $server > /dev/null 2>&1	
	if [ $? -eq 0 ]; then
		echo "Server $server is reachable"
	else
		echo "Server $server is unreachable"

	fi
done
