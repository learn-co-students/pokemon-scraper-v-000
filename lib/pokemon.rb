class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.save(@id, @name, @type, @db)
    #db = SQLite3::Database.new('db/pokemon.db')
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @name, @type, )
    end
  end

end
