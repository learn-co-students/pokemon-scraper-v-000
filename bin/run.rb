require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

pikachu = Pokemon.find(1, @db)
binding.pry
