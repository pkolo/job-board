## Job Board API

A RESTful API built on Rails 5 that allows clients to view, create, edit, and delete job postings. It is the official backend of the [Job Blob](https://github.com/pkolo/job-blob) web-app. It is backed by a `postgresql` database, and depends on the gems `rspec`, `faker`, `database_cleaner`, and `factory_girl` (mostly for testing).

The full API endpoint documentation can be found [here](https://github.com/pkolo/job-board/blob/master/APIdocs.md).

#### To install

Fork and clone the repo, `cd` into the directory, and

* `bundle install`
* `bundle exec rake db:create`
* `bundle exec rake db:migrate`
* `bundle exec rake db:seed`


#### To run

Once installed, `rails s` should start up the server.

#### To test

`bundle exec rspec` and watch everything (hopefully) pass! If something doesn't pass, please let me know.
