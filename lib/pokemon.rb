class Pokemon
  attr_accessor :id
  attr_reader :name, :type, :db

  def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) values('#{name}', '#{type}')")
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
  end
end
