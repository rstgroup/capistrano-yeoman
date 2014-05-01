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

and link your app/curent/dist folder in your nginx/apache/other web serwer.

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
