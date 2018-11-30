class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
#Pokemon .initialize is initialized with keyword arguments of id, name, type and db
    @id = id
    @name = name
    @type = type
    @db = db
    #@@all << self
  end

  def self.find(id,db)

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    #@db.execute("INSERT * FROM pokemon WHERE name = 'Pikachu
    #INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
  end

end
