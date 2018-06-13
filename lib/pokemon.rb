class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find( id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_instance = self.new(id:array[0], name:array[1], type:array[2], db:db)
    new_instance
  end

end
