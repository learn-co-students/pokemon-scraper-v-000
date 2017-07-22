class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:,name:,type:,db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    Pokemon.new(id:pokemon.flatten[0], name:pokemon.flatten[1], type:pokemon.flatten[2], db:db)
  end

  def alter_hp(newhp, db)
    self.db.execute("UPDATE pokemon SET hp = #{newhp} WHERE id = #{self.id}")
  end

  def hp
    self.db.execute("SELECT hp FROM pokemon WHERE id = #{self.id}").flatten[0]
  end
end
