class Pokemon
attr_reader :id, :name, :type, :db, :hp
  @@all = []

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db  = db
    @@all << self
  end

  def self.save (name, type, db )
    db.execute("INSERT INTO pokemon (name, type) VALUES  (?, ?)", name, type)
  end

  def self.find(id, db)
    db_pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)[0]
    if @@all.collect {|pokemon|pokemon.id}.include?(id)
      @@all.detect {|pokemon| id == pokemon.id}
    else
      self.new(id: db_pokemon[0], name: db_pokemon[1], type: db_pokemon[2], db: db)
    end
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
    @hp = hp
  end

end
