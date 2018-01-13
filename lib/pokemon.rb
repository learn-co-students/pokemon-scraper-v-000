class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(name=nil, type=nil, id=nil, hp=nil, db)
  	@name = name || db[:name]
  	@type = type || db[:type]
  	@id = id || db[:id]
  	if hp != nil
  		@hp = hp
  	end
  	@db = db
  end

  def self.save(pk_name, pk_type, db)
  	db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", pk_name, pk_type)
  end

  def self.find(id, db)
  	pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)
  	pokemon_array = pokemon[0]
  	#binding.pry
  	Pokemon.new(pokemon_array[1], pokemon_array[2], pokemon_array[0], pokemon_array[3], db)
  end

  def alter_hp(hp, db)
  	self.hp = hp
  	db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
  	#binding.pry
  end
end
