class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    result = database_connection.execute("SELECT * from pokemon WHERE pokemon.id == (?)", id)
    # puts "result = #{result}"
    # puts "result info = #{result[0]} || id = #{result[0][0]} || name = #{result[0][1]} || type = #{result[0][2]} || hp = #{result[0][3]}"
    pokemon_from_db = Pokemon.new(id: result[0][0], name: result[0][1], type: result[0][2], db: database_connection)
    pokemon_from_db.hp = result[0][3] if !(result[0][3] == nil)
    # puts "New Pokemon || id = #{pokemon_from_db.id} || name = #{pokemon_from_db.name} || type = #{pokemon_from_db.type} || hp = #{pokemon_from_db.hp}"
    pokemon_from_db
  end

  def alter_hp(hp, database_connection)
    # puts "Update pokemon #{@id} hp to #{hp}"
    database_connection.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id == (?)", hp, @id)
    # result = database_connection.execute("SELECT * from pokemon WHERE pokemon.id == (?)", @id)
    # puts "result = #{result}"
  end

end
