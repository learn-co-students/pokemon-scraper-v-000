class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(attributes)
    attributes.each {|k, v| self.send("#{k}=", v)}
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db, hp: 60)

  end
end
