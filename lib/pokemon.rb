class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)", [pk_name, pk_type])
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT *
      FROM pokemon
      WHERE pokemon.id = ?", id).flatten
    new_pokemon = Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon
      SET hp = ?
      WHERE id = ?", new_hp, id).flatten
  end
end
