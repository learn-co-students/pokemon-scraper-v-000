class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first

    Pokemon.new(id: id, name: results[1], type: results[2], db: db, hp: results[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
