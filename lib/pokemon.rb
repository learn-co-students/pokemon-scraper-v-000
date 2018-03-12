class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_num, db)
    poke_new = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).first
    pokemon = Pokemon.new(id: poke_new[0], name: poke_new[1], type: poke_new[2], db: db )
  end

  def alter_hp(id, db)
    db.execute()
  end
end
