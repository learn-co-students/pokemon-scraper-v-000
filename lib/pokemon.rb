class Pokemon

  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(name:, type:, id:, db:, hp:60)
    @id = id
    @hp = hp
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id_num, db)
      pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
      Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end

end
