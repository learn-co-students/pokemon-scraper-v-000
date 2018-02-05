class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)

  end

  def self.find(id, db)

    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first

    self.new(id:id,name:pokemon[1],type:pokemon[2],db:db)

  end

end
