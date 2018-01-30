class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id =?", self.id)
  end

end
