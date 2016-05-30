class Pokemon

  attr_accessor :id, :name, :type, :db

def initialize(id,name, type, db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
end


def self.find(id, db)
  db.execute("SELECT id, name, type FROM pokemon")
end

end
