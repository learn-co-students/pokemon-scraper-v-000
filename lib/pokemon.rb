class Pokemon
  attr_accessor :id, :name, :type, :db
  
  ALL = []
  
  def initialize (pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    ALL << self 
    pokemon
  end 
  
  def self.all 
    ALL
  end 
  
  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type) 
  end 
  
  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
    make_pokemon = {id: id, name: name, type: type, db: db}
    new_pokemon =  Pokemon.new(make_pokemon)
  end 
end
