class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(id)
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    new_poke = Pokemon.new(id)
    new_poke.name = data[1]
    new_poke.type = data[2]
    binding.pry
    new_poke
  end
end
