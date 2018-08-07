require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

@@all = []

 def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

 def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end

 def self.find(id, db)
   found = db.execute("SELECT * FROM pokemon WHERE id = ?", id) #can't interpolate in sql 
   lost = []
   lost = found.flatten
   Pokemon.new(id: lost[0], name: lost[1], type: lost[2], db: db) #need to be key value pairs
 end

end
