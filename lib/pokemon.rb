class Pokemon

  attr_accessor :id, :name, :type, :db

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
  new_poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
 	Pokemon.new(id:new_poke[0], name:new_poke[1], type:new_poke[2], db: db)
end

end
