# Pokemon Scraper

## Objectives

- Set up an `SQLite` database
- Scrape and save data into your database
- Use data to make ruby objects

### Overview

In this lab, you will set up your schema, scrape data, insert it into your db and
then build out methods to manipulate your data.

For our purposes, the `Pokemon` class is responsible for saving, adding,
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
Notice that #initialize requires [keyword arguments][].  

[keyword arguments]: http://stackoverflow.com/questions/15062570/when-to-use-keyword-arguments-aka-named-parameters-in-ruby

### A Note On Inserting Into the Database

When you use SQL to insert into a database you write out the values by hand and
insert them into the database.  However, when you insert your Pokémon into the
database you don't want to insert them into the query via string interpolation
because of potential [dangerous consequences][]. Instead, we can do two things:

- We can [sanitize][] the data by removing non-alphanumeric characters
- We can [parameterize][] the query

It is generally recommended to go with parameters. Check out this [Stack Overflow
question][] for a good example.

[dangerous consequences]: http://xkcd.com/327/
[sanitize]: https://www.quora.com/What-exactly-is-data-sanitization-with-respect-to-SQL-injection
[parameterize]: https://stackoverflow.com/questions/4712037/what-is-parameterized-query
[Stack Overflow question]: http://stackoverflow.com/questions/13462112/inserting-ruby-string-into-sqlite

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/pokemon-scraper' title='Objectives:'>Objectives:</a> on Learn.co and start learning to code for free.</p>
