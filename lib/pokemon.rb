class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp] || nil
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pk = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id])
    pk_hash = {id: pk[0][0], name: pk[0][1], type:pk[0][2], db: db, hp: pk[0][3]}
    pk_new = Pokemon.new(pk_hash)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE Pokemon SET hp = ? WHERE id= ?", [hp_new, self.id])
  end
end
