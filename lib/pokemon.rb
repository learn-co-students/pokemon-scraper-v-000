class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
##################################
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @db = id, name, type, db
  end #end the initialize
##################################
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end #end save
##################################
  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end #end find
end #end the pokemon class
