class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) 
      VALUES (?, ?)", name, type)
  end

  def self.find( id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    array_2 = array[0]
    new_instance = self.new(id:array_2[0], name:array_2[1], type:array_2[2], db:db)
  end

end
