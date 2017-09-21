class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  #initialized with keyword arguments of name, type and db
  def initialize(attributes, hp = nil)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    #insert values into database
    db.execute("INSERT INTO pokemon ( name, type ) VALUES (? , ?)", [name, type])
  end

  def self.find(id, db)

      pokemon_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

      new_pokemon = Pokemon.new(:id => pokemon_db[0][0], :name => pokemon_db[0][1], :type => pokemon_db[0][2], :hp => pokemon_db[0][3])

      new_pokemon
  end

  def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
