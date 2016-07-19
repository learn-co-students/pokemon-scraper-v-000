require_relative "environment.rb"

db = SQLite3::Database.new('db/pokemon.db')
sql_runner = SQLRunner.new(db)