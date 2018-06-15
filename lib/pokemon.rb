

  # .initialize
  #   is initialized with keyword arguments of name, type and db (FAILED - 5)
  # .save
  #   saves an instance of a pokemon with the correct id (FAILED - 6)
  # .find
  #   finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 7)

class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  @@all = []
  
  def initialize(id:, name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name,type)
  end
  
  
  def self.find(find_id,db)
      poke = db.execute("SELECT * FROM pokemon WHERE id = ?", find_id)
      poke = poke.flatten
      # binding.pry
      self.new(id: poke[0], name: poke[1], type: poke[2], db: db)
  end
 

  
end
