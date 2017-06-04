class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp
  end

  def self.save(name, type, db)
    #db.execute("INSERT INTO #{db} (name, type) VALUES (#{name},#{type})")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pokemon_new = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: pokemon_new[0], name: pokemon_new[1], type: pokemon_new[2], db: db, hp: 60)
  end

  # def alter_hp(hp_new, db)
  #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_new, self.id)
  # end

end
