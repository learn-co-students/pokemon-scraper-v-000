class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  # #initialize alternative on learn:

  # def initialize(attr_array, db)
  #   @id, @name, @type, @hp = *attr_array
  #   @db = db
  # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name,type])
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]

    # or
    # db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
  end

end
