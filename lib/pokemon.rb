class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    self.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

  # def self.find(id, db)
  #   self.all.each do |pokemon_obj|
  #     if pokemon_obj.id == id
  #       return pokemon_obj
  #     end
  #   end
  # end
end
