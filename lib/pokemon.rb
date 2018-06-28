class Pokemon
  @@all = []
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.all
    @@all
  end


  def self.save( name, type, db)
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", name, type)
  end

  def self.find(id, db)

    new_pokemon = db.execute( "SELECT * FROM pokemon WHERE id = (?)", id )
    george = Pokemon.new(id: new_pokemon.flatten[0], name: new_pokemon.flatten[1], type: new_pokemon.flatten[2], db: db, hp: new_pokemon.flatten[3])
  end



end
