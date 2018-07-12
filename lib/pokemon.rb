class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)",@id, name, type)
  end

  def self.find(id,db)
    attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = #{id}")
    sup = self.new(id: attributes[0][0], name: attributes[0][1], type: attributes[0][2], db: db)
  end
end
