# drotpostagalamb
Postfix in a Docker container

### Build image:

docker build -t dpg .

### Run container:

docker run -d --name dpg-1 --restart always --hostname dpg dpg

### Send test message:

docker exec dpg-1 /bin/bash -c 'echo "Test mail thingy" | mail -s "Test message" destination@somewhere.com'
