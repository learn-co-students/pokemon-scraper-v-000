class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    # @id = attributes[:id]
    # @name = attributes[:name]
    # @type = attributes[:type]
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
    attributes[:db] = db
    Pokemon.new(attributes)
  end

  def self.all
    all
  end

  def alter_hp(damage)
  end
end
