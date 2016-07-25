class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

def initialize(id, name, type, db)
  @name = name
  @type = type
  @db = db
  @id = id
#  @hp = hp
end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
end

def self.find(num, db)
  db.execute("SELECT * FROM pokemon WHERE id=?", num)
end

def alter_hp(new_hp, id)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
end

#db.execute("UPDATE pokemon SET ")


end
