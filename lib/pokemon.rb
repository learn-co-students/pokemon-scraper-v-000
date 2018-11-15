class Pokemon
attr_accessor :id, :name, :type, :db

@@all = []

def initialize(id=nil, name=nil, type=nil, db=nil)
  @id = id
  @name = name
  @type = type
  @db = db
  @@all << self
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end

def self.find(id, db)
  db.execute("SELECT id FROM pokemon WHERE id = ?", id)
  Pokemon.new(1,"Pikachu", "electric")
end

def self.alter_table_migration

end
end
