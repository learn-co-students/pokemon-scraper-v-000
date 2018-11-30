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
      db.execute("SELECT pokemon WHERE id = #{{id}}
      Pokemon.new(id)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end


end
