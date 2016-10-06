capistrano-scm-localcopy
===================

A copy strategy for Capistrano 3, which mimics the `:copy` scm of Capistrano 2.

This will make Capistrano tar the current directory, upload it to the server(s) and then extract it in the release directory.

Based on wercker's [capistrano-scm-copy](https://github.com/wercker/capistrano-scm-copy)

Requirements
============

Machine running Capistrano:

- Capistrano 3
- tar

Servers:

- mktemp
- tar

Installation
============

First make sure you install the capistrano-scm-copy by adding it to your `Gemfile`:

    gem "capistrano-scm-localcopy"

Add to Capfile:

    require 'capistrano/localcopy'
    
Then switch the `:scm` option to `:localcopy` in `config/deploy.rb`:

    set :scm, :localcopy
    
TODO
====

Add unit tests.

License
=======

The MIT License (MIT)

Changelog
=========

0.1.0
-----

- Initial release, based on https://github.com/wercker/capistrano-scm-copy

