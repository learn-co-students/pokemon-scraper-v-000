## Objectives:
1. Set up a `SQLite` database
2. Scrape and save data into your database
3. Use data to make ruby objects

### Overview
In this lab you will set up your schema, scrape data, insert it into your db and
then build out methods to manipulate your data.

For our purposes the `Pokemon` class is responsible for saving, adding,
removing, or changing anything about each Pokémon. Your scraper is not
responsible for knowing anything about them.

### Note
We have set up your scraper class for you, which you can see in
`lib/scraper.rb`. We have also created a `schema_migration.sql` file that will
run the `SQL` statement to set up your database in `db/pokemon.db`. Your only
job is to build out the methods to save and find pokemon in the database.

### Create Our Pokemon Class
Our `Pokemon` class can be found in `lib/pokemon.rb`.
This is where you will build your methods.

### A Note On Inserting Into the Database
When you use sql to insert into a database you write out the values by hand and
insert them into the database.  However, when you insert your Pokémon into the
database you don't want to insert them into the query via string interpolation
because of potential [dangerous consequences](http://xkcd.com/327/).
Instead we need to [sanitize](http://stackoverflow.com/questions/9614236/escaping-strings-for-ruby-sqlite-insert)
the data that goes into the query string you need to [execute](http://stackoverflow.com/questions/13462112/inserting-ruby-string-into-sqlite).


### Getting Started
- Fork this repo, and clone your fork.
- `bundle install` (if that doesn't work run `bundle update`)
- Follow the pending RSPEC tests to get your sense of direction.

### BONUS
Now that we got every pokemon we want to get them ready to fight. (Did you really think you and Arel weren't going to have a battle after capturing every pokemon?) But if they battle we need to keep track of their hp (health power).  And the only way to do that is to alter the database.  What would be perfect is a sql query that adds an `hp` column and default value of 60 to every row.  That sql query should be put into a migration file in `db/`.

Once the `hp` column is set up there should be an Pokemon class method called `alter_hp` that will allow us to change a specific pokemon's health to a new hp.  It will need to take the id of the pokemon, a new health power as well as the database we're dealing with as arguments.

Follow the pending specs for more information. (If you choose to skip the bonus section, be sure to comment out or delete the specs in the `spec/pokemon_spec.rb` file in the `describe 'BONUS' do... end` section in order to pass the lab.)


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/pokemon-scraper' title='Objectives:'>Objectives:</a> on Learn.co and start learning to code for free.</p>
