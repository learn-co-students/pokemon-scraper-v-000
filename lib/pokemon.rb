class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
  end

  def self.find(id, db)
    attributes = {
      :id => db.execute("SELECT pokemon.id FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :name => db.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      :type => db.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id == #{id};")[0][0],
      # :hp => db.execute("SELECT pokemon.hp FROM pokemon WHERE pokemon.id == #{id};")[0][0]
    }
    self.new(attributes)
  end

  def alter_hp(hp, db)
    puts self.hp
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
  end

end
