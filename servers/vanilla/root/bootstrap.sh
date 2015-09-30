aws s3 cp s3://jonahperez.com.minecraft/etc_init.d/minecraft /etc/init.d --region us-west-2
chmod a+x /etc/init.d/minecraft 
chkconfig minecraft on
aws s3 sync s3://jonahperez.com.minecraft/minecraft_home /home/minecraft --region us-west-2
aws s3 cp s3://jonahperez.com.minecraft/latest.tar.gz . --region us-west-2
tar xzf latest.tar.gz -C /home/minecraft
chown -R minecraft:minecraft /home/minecraft
service minecraft start 
aws s3 cp s3://jonahperez.com.minecraft/usr_bin/mon-put-instance-data.pl /usr/bin --region us-west-2
chmod a+x /usr/bin/mon-put-instance-data.pl
echo "*/5 * * * * mon-put-instance-data.pl --mem-util --mem-used --mem-avail --disk-space-used --disk-space-avail --disk-space-util --disk-path=/ --from-cron" >> /etc/crontab
echo "0 * * * * /etc/init.d/minecraft backup" >> /etc/crontab
crontab /etc/crontab

