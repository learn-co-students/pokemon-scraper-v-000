class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO Pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    p = db.execute( "SELECT * FROM Pokemon WHERE id = ? ;", id).flatten
    Pokemon.new(id:p[0], name:p[1], type:p[2], db:db)
  end

end
