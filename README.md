# Shopping List

# ⚠️ TBA! ⚠️

### To run locally

Dependencies:
* Ruby 2.5.1
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
rails server
```

### Resources

* [How to use MySQL With Your Ruby on Rails Application](https://www.1and1.com/cloud-community/learn/application/ruby-on-rails/how-to-use-mysql-with-your-ruby-on-rails-application/)
