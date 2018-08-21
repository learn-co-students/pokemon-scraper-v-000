class Pokemon
  # Our class requires an id, name, type of pokemon, and a reference to the database
  attr_accessor :id, :name, :type, :db, :hp


  # Initialize the new instance of pokemon object with the attributes and push/shovel object to @@all
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(pokname, poktype, database1)
      database1.execute("INSERT INTO pokemon (name, type) Values (?, ?)", [pokname, poktype])
  end

  def self.find(pok_id, database)
      new_pokemon = database.execute("SELECT * FROM pokemon WHERE id = (?)", [pok_id])
      new_pokemon = new_pokemon[0]
      if new_pokemon[3] == ""
        hp = 60
      else
        hp = new_pokemon[3]
      end
      new_pok_object  = Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: database, hp: hp)
      new_pok_object
      # binding.pry
  end

  def alter_hp(new_hp, database)
    # binding.pry
    self.hp = new_hp
    id = self.id
    database.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, id)
  end

end
