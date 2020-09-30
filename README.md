# drotpostagalamb
Postfix in a Docker container

### 1. Review Dockerfile:

Check the following line and complete it with proper email address and password in clear text:

echo '[smtp.gmail.com]:587    <yourGmailAddress>@gmail.com:<yourPassword>' >> /etc/postfix/sasl_passwd && \

### 2. Build image:

docker build -t dpg .

### 3. Run container:

docker run -d --name dpg-1 --restart always --hostname dpg dpg

### 4. Send test message:

docker exec dpg-1 /bin/bash -c 'echo "Test mail thingy" | mail -s "Test message" destination@somewhere.com'
