class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_number, db)
    poke_find = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten # WHERE id = '#{id}'")
    #binding.pry
    Pokemon.new(id: poke_find[0], name: poke_find[1], type: poke_find[2], hp: poke_find[3], db: db)
  end

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end


  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
