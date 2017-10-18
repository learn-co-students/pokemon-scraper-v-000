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
    new_name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).join("")
    new_type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).join("")
    self.new(id: id, name: new_name, type: new_type, db: db)
  end

  #def alter_hp(hp, db)

  #end

end
