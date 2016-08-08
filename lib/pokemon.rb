class Pokemon

  attr_accessor :id, :name, :type, :db 

  def initialize(id, name, type, db)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon")
  end

end




# Pokemon
#   .initialize
#     is initialized with a name, type and db (FAILED - 1)
#   .save
#     saves an instance of a pokemon with the correct id (FAILED - 2)
#   .find
#     finds a pokemon from the database (FAILED - 3)
#   BONUS
#     knows that a pokemon have a default hp of 60 (FAILED - 4)
#     alters Pikachu's hp to 59 (FAILED - 5)
#     alters Magikarp's hp (FAILED - 6)