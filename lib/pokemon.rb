class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes)
    @hp = 60
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    attributes = {}
    attributes[:id] = pokemon_array[0][0]
    attributes[:name] = pokemon_array[0][1]
    attributes[:type] = pokemon_array[0][2]
    if pokemon_array[0][3] != nil
      attributes[:hp] = pokemon_array[0][3]
    end
    attributes[:db] = db
    Pokemon.new(attributes)
  end

  def self.all
    all
  end

  def alter_hp(new_health, db)
    db.execute("UPDATE pokemon SET hp = #{new_health} WHERE id = #{@id}")
    @hp = new_health
  end
end
