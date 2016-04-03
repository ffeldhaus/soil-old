# SOIL game

## Setup

1. [Install rbenv](https://github.com/rbenv/rbenv#installation)
2. [Install ruby-build plugin](https://github.com/rbenv/ruby-build#installing-as-an-rbenv-plugin-recommended)
3. [Install rbenv-gemset plugin](https://github.com/jf/rbenv-gemset#github)
4. Build ruby 2.3.0 with `rbenv install 2.3.0 -v`. You may need to manually specify the openssl directory with e.g. `RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt rbenv install 2.3.0 -v`
5. Clone soil `git clone https://github.com/ffeldhaus/soil.git soil`
6. Change to soil directory `cd soil`
7. Install Bundler `gem install bundler`
8. Re-Link bundler to current rbenv ruby `rbenv rehash`
9. Install all gems with bundler `bundle install`
10. Re-Link binaries (e.g. rails) to current rbenv ruby `rbenv rehash`
