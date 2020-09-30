# drotpostagalamb

Postfix in Docker

docker build -t dpg .
docker run -d --name dpg-1 --restart always --hostname dpg dpg
docker exec dpg-1 /bin/bash -c 'echo "Test mail thingy" | mail -s "Test message" destination@somewhere.com'
