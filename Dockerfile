FROM ubuntu

LABEL maintainer="laszlo.zoltan.kiss@gmail.com"

RUN apt-get update && \
echo "postfix postfix/main_mailer_type string Internet site" > preseed.txt && \
echo "postfix postfix/mailname string dpg.lan" >> preseed.txt && \
debconf-set-selections preseed.txt && \
apt-get install -y postfix mailutils libsasl2-2 ca-certificates libsasl2-modules && \
sed -i 's/relayhost =/relayhost = [smtp.gmail.com]:587/g' /etc/postfix/main.cf && \
echo 'smtp_sasl_auth_enable = yes' >> /etc/postfix/main.cf && \
echo 'smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd' >> /etc/postfix/main.cf && \
echo 'smtp_sasl_security_options = noanonymous' >> /etc/postfix/main.cf && \
echo 'smtp_tls_CApath = /etc/ssl/certs' >> /etc/postfix/main.cf && \
echo 'smtpd_tls_CApath = /etc/ssl/certs' >> /etc/postfix/main.cf && \
echo 'smtp_use_tls = yes' >> /etc/postfix/main.cf && \
echo '[smtp.gmail.com]:587    <yourGmailAddress>@gmail.com:<yourPassword>' >> /etc/postfix/sasl_passwd && \
chmod 400 /etc/postfix/sasl_passwd && \
postmap /etc/postfix/sasl_passwd

CMD ["sh", "-c", "service postfix start ; tail -F /var/log/mail.log"]
