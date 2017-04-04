class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp:60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)" ,name,type )
  end

  def self.find(id, db)
    result = db.execute("SELECT * from pokemon Where pokemon.id = ?", id)
    # result [[name, type]]

    # pokemon
    Pokemon.new(id: id, name: result[0][1], type:result[0][2], db: db, hp:result[0][3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)

  end


end
