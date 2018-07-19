class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", name, type)
  end

  def self.find(idNum, db)
    arr = db.execute("SELECT * from pokemon WHERE id = ?", idNum).flatten
    Pokemon.new(id: arr[0], name: arr[1], type: arr[2], db: db)
  end
end
