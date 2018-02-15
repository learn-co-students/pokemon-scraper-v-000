class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, database_connection)
    # saves an instance of a pokemon with the correct id
    # binding.pry
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database)
    # finds a pokemon from the database by their id number and returns a new Pokemon object
    # The find method creates a new Pokemon after selecting their row from the database by their id number.
    # return a new pokemon object
    pokemon = database.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: database)
  end

  def alter_hp(new_hp, database)
    # binding.pry
    database.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end
end
