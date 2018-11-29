class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO Pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    p = db.execute( "SELECT * FROM Pokemon WHERE id = ? ;", id).flatten
    # binding.pry
    Pokemon.new(id:p[0], name:p[1], type:p[2], db:db, hp:p[3])
  end

  def alter_hp(hp, db)
    #binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id.to_s)
    self.hp = hp
    # binding.pry
  end

end
