class Pokemon

  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize (id:,name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
      @@all << self
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    row_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: row_data[0], name: row_data[1], type: row_data[2], db: db)
  end



end
