class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
  end

  # def alter_hp(altered_hp, db)
  #   db.execute("UPDATE pokemon SET hp=? WHERE id=?", altered_hp)
  # end
end
