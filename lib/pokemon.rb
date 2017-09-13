class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id:, name:, type:, db:)
      @name = name
      @type = type
      @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
     x = self.new(id: nil, name: nil, type: nil, db: nil)
     x.id = row[0][0]
     x.name = row[0][1]
     x.type = row[0][2]
     x
  end
end
