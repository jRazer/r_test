#!/bin/bash

apt update
apt install postgresql postgresql-contrib
wget https://golang.org/dl/go1.15.8.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.8.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'pass';"

wget https://raw.githubusercontent.com/jRazer/r_test/main/up.sql

wget https://raw.githubusercontent.com/jRazer/r_test/main/helloworld_linux_amd64

export PGPASSWORD='pass'; psql -h 'localhost' -U 'postgres' -d 'postgres' < up.sql

mv helloworld_linux_amd64 /opt

cd/opt && go run ./helloworld_linux_amd64
