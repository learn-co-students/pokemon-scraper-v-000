class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args)
    args.each {|k, v| self.instance_variable_set("@#{k}", v) unless v.nil?}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @id, name, type)
  end

  def self.find(id, db)
    data_array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    Pokemon.new({
      id: data_array[0],
      name: data_array[1],
      type: data_array[2],
      hp: data_array[3]
      })
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = (?)", hp, self.id)
    self.hp = hp
  end
end
