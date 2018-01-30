class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name = "", type = "", db = nil, hp = nil)
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [name, type])
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id};")
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id};")

    begin #implement a try/catch block to handle both the first and bonus tests regarless of whether the hp column exists
      hp = db.execute("SELECT hp FROM pokemon WHERE id = #{id};")
      new_pokemon = Pokemon.new(name[0][0], type[0][0], db, hp[0][0])

    rescue SQLite3::SQLException
      new_pokemon = Pokemon.new(name[0][0], type[0][0],db)

    end

    new_pokemon.id = id
    new_pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = #{@id};", hp)
  end

end
