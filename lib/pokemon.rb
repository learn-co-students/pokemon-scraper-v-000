class Pokemon
  attr_accessor :name, :type, :db, :id

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(name: poke_info[1], type: poke_info[2], id: poke_info[0], db: db)
  end

end
