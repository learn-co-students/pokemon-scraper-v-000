class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id: "default", name: "default", type: "default", db: "default")
    self.id = id
    self.name = name
    self.type = type
    self.db = db
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

def self.find(id_num, db)
pokemon = db.execute("SELECT * FROM pokemon where id=?", id_num).flatten
Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2])
end

end
