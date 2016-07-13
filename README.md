# SOIL game

## Setup

1. Create a new user named `soil` and become the user with e.g. `su -l soil`
2. [Install rbenv](https://github.com/rbenv/rbenv#installation)
3. [Install ruby-build plugin](https://github.com/rbenv/ruby-build#installing-as-an-rbenv-plugin-recommended)
4. [Install rbenv-gemset plugin](https://github.com/jf/rbenv-gemset#github)
5. Build latest ruby with `rbenv install $(rbenv install -l | grep -v - | tail -1) -v`. You may need to manually specify the openssl directory with e.g. `RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt rbenv install $(rbenv install -l | grep -v - | tail -1) -v`
6. Clone soil `git clone https://github.com/ffeldhaus/soil.git soil`
7. Change to soil directory `cd soil`
8. Install Bundler `gem install bundler`
9. Re-Link bundler to current rbenv ruby `rbenv rehash`
10. Install all gems with bundler `bundle install`
11. Re-Link binaries (e.g. rails) to current rbenv ruby `rbenv rehash`
12. Install postgresql
13. Init postgresql with `initdb -D $HOME/soil/db/pgsql -U soil`
14. Change `listen_addresses` and `port` in `db/pgsql/postgresql.conf` if necessary
15. Start postgresql with `postgres -D $HOME/soil/db/pgsql >$HOME/soil/log/pgsql.log 2>&1 &`
16. You may need to create a database for the `soil` user with `createdb` or, if the port is different than 5432 then with `createdb -p <port>` (change `<port>` to the port number)
17. Create the file `config/database.yml` file and insert the following (adapt database name, host and port):
```
production:
  adapter: postgresql
  database: soil
  host: 127.0.0.1
  port: 5433
  encoding: unicode
  pool: 5
```
18. Setup database with `RAILS_ENV=production rake db:reset`
19. Start Rails server with `puma -b tcp://127.0.0.1:3000 -e production -d` (change 127.0.0.1 to the public IP of the server if you do not use a reverse proxy) and test connection on <IP>:3000

## Upgrading

1. Upgrade rbenv
  1. cd ~/.rbenv
  2. git pull
2. Upgrade ruby-build plugin
  1. cd ~/.rbenv/plugins/ruby-build
  2. git pull
3. Upgrade rbenv-gemset plugin
  1. cd ~/.rbenv/plugins/rbenv-gemset
  2. git pull
4. Build latest ruby `rbenv install $(rbenv install -l | grep -v - | tail -1) -v`. You may need to manually specify the openssl directory with e.g. `RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt rbenv install $(rbenv install -l | grep -v - | tail -1) -v`
5. Upgrade soil
  1. cd ~/soil
  2. git pull
6. Install Bundler `gem install bundler`
7. Re-Link bundler to current rbenv ruby `rbenv rehash`
8. Install all gems with bundler `bundle install`
9. Re-Link binaries (e.g. rails) to current rbenv ruby `rbenv rehash`
10. Upgrade postgresql
