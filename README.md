# Capistrano::Yeoman

Capistrano plugin that integrates Yeoman workflow into capistrano deployment script.

## Installation

### If you have Gemfile

Add those lines to your application's Gemfile:

    gem 'capistrano', '~> 3.1'
    gem 'capistrano-yeoman'

And then execute:

    $ bundle install

### If not - install it yourself as:

    $ gem install capistrano-yeoman

## Usage

```
  # Capfile
  require 'capistrano/yeoman'

```

```
  # config/deploy.rb
  set :linked_dirs, %w{node_modules app/bower_components}
  namespace :deploy do
  ...
    after :published, "yo:build"
  ...
  end

```

and link your ...appdir/curent/dist folder in your nginx/apache/other web serwer.

## How it works?

After updating code on the server it:

1. installs yeoman (if its not already installed)
2. runs `npm install`
3. runs `bower install`
4. finally `$grunt build`

## Dependencies

Nodejs with npm have to be installed on your server. In case of using sass also ruby with compass should be in your PATH.

It's good to update the npm before first deploy (`sudo npm update npm -g`), but after that be sure that your deploying user has access to ~/.npm dir and ~/tmp (if it exist).

## Tasks

- yo:install - installs yeoman locally in node_modules (only if its not already installed)
- grunt:build
- bower:install
- npm:install

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
