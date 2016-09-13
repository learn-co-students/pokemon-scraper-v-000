class Pokemon

  attr_accessor :id, :name, :type, :db

  @@pokemons = []

  def initialize(id, name, type, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    @@pokemons << self
    self.class.save(name, type, db, id)
  end

  def alter_hp(hp)
    stm = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?;")
    stm.bind_params(hp, self.id)
    stm.execute
  end

  def self.save(name, type, db, id = nil)
    if id = nil
      poke_index = @@pokemons.find_index { |pokemon| pokemon.name == name && pokemon.type == type }
      id = @@pokemons[poke_index].id
    end
    stm = db.prepare("INSERT INTO pokemon (id, name, type) VALUES ( ?, ?, ? );")
    stm.bind_params(id, name, type)
    stm.execute
  end

  def self.find(id, db)
    # stm = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    # stm.bind_params(id)
    # rs = stm.execute
    # rs.next
    db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
  end

end
