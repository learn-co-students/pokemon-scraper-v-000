require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!

#touch db/pokemon.db

#sqlite3 db/pokemon.db < schema_migration.sql 