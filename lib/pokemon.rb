class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pk_arr = db.execute("SELECT * FROM Pokemon WHERE id = ?", [id])
    pk_hash = {id: pk[0][0], name: pk[0][1], type:pk[0][2], db: db}
    Pokemon.new(pk_hash)
  end
end
