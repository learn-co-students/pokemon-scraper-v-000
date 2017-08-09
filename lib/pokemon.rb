class Pokemon
  attr_accessor :type, :name, :db, :id, :hp

  def initialize(type: nil, name: nil, db: nil, id: nil)
    @id = id
    @type = type
    @name = name
    @db = name
  end

  def self.save(name , type, db)
      db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("select * from pokemon where id = ?", id).flatten
    new_pokemon = self.new
    new_pokemon.type = pokemon[2]
    new_pokemon.name = pokemon[1]
    new_pokemon.id = pokemon[0]
    new_pokemon.hp = pokemon[3]
    new_pokemon.db = db
    new_pokemon
  end

  def alter_hp(hp, db)
    db.execute("update pokemon set hp = ? where hp = 60", hp)
  end
end
