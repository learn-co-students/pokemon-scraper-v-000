class Pokemon

  attr_accessor :id, :name, :type, :db

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db, id)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?,?,?)", id, name, type)
  end

end
