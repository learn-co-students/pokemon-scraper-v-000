class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp:nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?);", name, type)
  end

  def self.find(id, db)
    row =  db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id:row[0], name:row[1], type:row[2], hp:row[3], db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", new_hp, self.name)
  end

end
