require 'pry'

class Pokemon

	attr_accessor :id, :name, :type, :hp, :db

	def initialize(attr_array, db)
    	@id, @name, @type, @hp = *attr_array
    	@db = db
  	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
		Pokemon.new(info, db)
	end

	def alter_hp(new_hp)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
	end


end

# rspec spec/pokemon_spec.rb
