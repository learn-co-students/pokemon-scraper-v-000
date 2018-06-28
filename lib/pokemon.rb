class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}') ; " )
  end

  def self.find(id, db)

    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'; ").flatten
    new_pokemon = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db, hp: pokemon_array[3])
    new_pokemon
  end

  def alter_hp(hp, db)
   db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE id = '#{self.id}' ;")
  end

end
