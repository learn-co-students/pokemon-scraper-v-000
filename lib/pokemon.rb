class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db: )
    @id = id
    @name = name
    @type = type
    @db = db
  end

  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type )
  end
  
  def self.find(id_num, db)
    find_poke = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).first
    Pokemon.new(id: find_poke[0], name: find_poke[1], type: find_poke[2], db: db )
  end
end
