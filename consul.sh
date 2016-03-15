docker run -d \
	-p "8500:8500" \
	-h "consul" \
	progrium/consul -server -bootstrap
