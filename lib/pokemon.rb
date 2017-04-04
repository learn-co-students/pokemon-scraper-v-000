class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)" ,name,type )
  end

  def self.find(id, db)
    result = db.execute("SELECT name, type from pokemon Where pokemon.id = ?", id)
    # result [[name, type]]

    # pokemon
    Pokemon.new(id: id, name: result[0][0], type:result[0][1], db: db)
  end



end
