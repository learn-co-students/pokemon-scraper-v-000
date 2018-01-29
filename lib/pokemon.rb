require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    find_result = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    Pokemon.new(id: id, name: find_result[1], type: find_result[2], db: db)
  end
end


## ALMOST WORKING BONUS

# schema_migration.sql ALTER TABLE pokemon ADD hp INTEGER NOT NULL DEFAULT 60;

# require 'pry'
#
# class Pokemon
#   attr_accessor :id, :name, :type, :db, :hp
#
#   def initialize(id:, name:, type:, db:, hp: nil)
#     @name = name
#     @type = type
#     @db = db
#     @id = id
#     @hp = hp
#   end
#
#   def self.save(name, type, db)
#     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end
#
#   def self.find(id, db)
#     find_result = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
#     Pokemon.new(id: id, name: find_result[1], type: find_result[2], db: db, hp: find_result[3])
#   end
#
#   def alter_hp(hp, db)
#     db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
#   end
#
# end
