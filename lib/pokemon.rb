class Pokemon
  attr_accessor :hp
  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = nil
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO POKEMON (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM POKEMON WHERE id = ?", id)
    self.new(id:pokemon_array[0][0], name:pokemon_array[0][1], type:pokemon_array[0][2], db:db)
  end

  # def alter_hp(hp, db)
  #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  #   self.hp = hp
  # end

end
