# Pokemon Scraper

## Objectives

- Set up an `SQLite` database
- Scrape and save data into your database
- Use data to make ruby objects

### Overview

In this lab, you will:

1. Set up your schema
2. Scrape data
3. Insert it into your database
4. Build out methods to manipulate your data.

This mirrors a very "real world" task.

1. Set up a local database schema
2. Find something on the internet that you want to capture to _your_ local 
   database (copyright etc. permitting) and "scrape it"
3. For each interesting thing found on the internet...
4. Insert its information into your local database's schema by writing methods
5. _...and then_ write additional methods to your classes so that you can
   easily work with your local database

## Schema Provided

We have provided a `db/schema_migration.sql` file that will run the `SQL`
statements to set up your database in `db/pokemon.db`. You can initialize the
database file with `touch db/pokemon.db`.

> **Alert**: Make sure that your database is located in the `db` directory!

We can tell `sqlite3` to execute a migration script upon a new database with a
command like: `sqlite3 path/to/database.db < source_of_sql_data`.

## Scraper and Scrape-Content Provided

In this example, we're going to take information from a web page about those
adorable Pokémon. Instead of having you write a network code that retrieves a
Pokémon catalog and scrapes it, we're going to provide you a "scraper" class in
`lib/scraper.rb` and it's going to "scrape" a local HTML file
(`pokemon_index.html`). It shouldn't be too hard to see that with just a
_little_ bit of extra code we could scrape a "live" web page.

Your scraper **should not** do the work of inserting rows into the database.
Its role is to process the file, it should "hand-off" the creation
responsibilities to the Pokemon class. It's appropriate for the scraper to say
`Pokemon.create...` but it's not appropriate for the scraper to open up a
connection to the database.

The goal of an ORM class is to "glue" the scraper to the database.

Speaking of ORM classes...

## The Pokemon Class

The `Pokemon` class (`lib/pokemon.rb`) is responsible for saving, adding,
removing, or changing anything about each Pokémon.

It should be handed "raw" Pokémon data from the scraper and handle the ORM work
to put the data into the database. It's probably most appropriate to 

Create any methods you think you need to make working with the Pokémon data
easier.

Notice that #initialize requires [keyword arguments][].

### A Note On Inserting Into the Database

When you use SQL to insert into a database, you write out the values by hand
and insert them into the database.  However, when you insert your Pokémon into
the database you don't want to insert them into the query via string
interpolation because of potential [dangerous consequences][]. Instead, we can
do two things:

- We can [sanitize][] the data by removing non-alphanumeric characters
- We can [parameterize][] the query

It is generally recommended to use parameters. Check out this [Stack Overflow
question][] for a good example.

[dangerous consequences]: http://xkcd.com/327/
[sanitize]: https://www.quora.com/What-exactly-is-data-sanitization-with-respect-to-SQL-injection
[parameterize]: https://stackoverflow.com/questions/4712037/what-is-parameterized-query
[Stack Overflow question]: http://stackoverflow.com/questions/13462112/inserting-ruby-string-into-sqlite
[keyword arguments]: http://stackoverflow.com/questions/15062570/when-to-use-keyword-arguments-aka-named-parameters-in-ruby

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/pokemon-scraper' title='Objectives:'>Objectives:</a> on Learn.co and start learning to code for free.</p>
