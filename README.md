# Shopping List

# ⚠️ Under construction ⚠️

:)

Every week, Boost orders groceries from Countdown(?). It would be useful to have an app where we can record what is needed (items + quantity) ahead of time, as well as suggesting items for purchase.

### To run locally

Dependencies:
* Ruby 2.5.0
* Rails 5.2.1
* MySQL
   * Install & configure MySQL
   * Install the MySQL gem: `gem install mysql2`
   * Export your root MySQL password as an env variable (for use by [the DB config file](./config/database.yml)): `export SHOPPING_LIST_DATABASE_PASSWORD="my_password"` (or add to your `.bash_profile`)

```bash
git clone git@github.com:boost/shopping-list.git
cd shopping-list
bundle install
rake db:create
rails db:migrate
rails db:seed
rails server
```

Then go to `localhost:3000` in your browser 😀

To run tests:

Dependencies
* Chromedriver

```bash
bundle exec rspec
```

### Resources

* [How to use MySQL With Your Ruby on Rails Application](https://www.1and1.com/cloud-community/learn/application/ruby-on-rails/how-to-use-mysql-with-your-ruby-on-rails-application/)
* [custom controller action with link_to helper in Rails 5](https://medium.com/@brandonbaker40/custom-controller-action-with-link-to-helper-in-rails-5-520a19653a7f)
* [Better Specs `{ rspec guidelines with ruby }`](http://www.betterspecs.org)

### ToDos

- [SLACK] Make slack request execution a delayed job and respond to slack right away

HELLO
