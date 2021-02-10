#!/bin/bash

apt update
apt install postgresql postgresql-contrib -y
pg_ctlcluster 12 main start

wget https://golang.org/dl/go1.15.8.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.8.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

su - postgres psql -U postgres -d postgres -c "alter user postgres with password 'pass';"
sed -i 's/peer/md5/g' /etc/postgresql/12/main/pg_hba.conf
service postgresql restart

wget https://raw.githubusercontent.com/jRazer/r_test/main/up.sql
wget https://raw.githubusercontent.com/jRazer/r_test/main/helloworld_linux_amd64

psql "host=localhost port=5432 dbname=postgres user=postgres password=pass" < up.sql
chmod +x helloworld_linux_amd64
mv helloworld_linux_amd64 /opt

cd /opt && ./helloworld_linux_amd64
