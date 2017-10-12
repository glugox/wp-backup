
#!/bin/bash
# file: backup_run.sh
WPDBNAME=`cat public_html/wp-config.php | grep DB_NAME | cut -d \' -f 4`
WPDBUSER=`cat public_html/wp-config.php | grep DB_USER | cut -d \' -f 4`
WPDBPASS=`cat public_html/wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`

mkdir -p public_html/sql
find public_html/sql/ -name "*.sql" -type f -delete
mysqldump -u $WPDBUSER -p$WPDBPASS $WPDBNAME > public_html/sql/$WPDBNAME$(date +%s).sql

find public_html/ -name "*.tar.gz" -type f -delete
tar -czf backup_latest.tar.gz public_html/
mv backup_latest.tar.gz public_html/
