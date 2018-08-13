class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql, id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
  end

 def alter_hp(new_hp, db)
   sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
   #binding.pry
   db.execute(sql, new_hp, self.id)
 end

end
