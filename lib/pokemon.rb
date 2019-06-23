class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id = nil, name = nil, type = nil, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(otherid, db)
    newbie = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", otherid).flatten
    self.new(@id=newbie[0], @name=newbie[1],@type=newbie[2],@db=db)
  end

end
