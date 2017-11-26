require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end


# self.new("Pikachu", "electric", @db)

def self.find(id, db)
  where_pokemon = db.execute("SELECT * FROM pokemon WHERE id = id").flatten
  Pokemon.new(id: where_pokemon[0], name: where_pokemon[1], type: where_pokemon[2], db: db)
  # db.execute("SELECT id FROM pokemon WHERE id =?", id)
  #binding.pry
  # pokemon = Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
  # Pokemon.new(id = where_pokemon[0], name = where_pokemon[1], type= where_pokemon[2], @db)


end

end
