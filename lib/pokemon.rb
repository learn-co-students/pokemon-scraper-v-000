class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def self.find(pk_id, db)
    #db.execute("SELECT * FROM pokemon WHERE id =?", pk_id)
    pk_search = db.execute("SELECT * FROM pokemon WHERE id=?", pk_id).flatten
    Pokemon.new(id: pk_search[0], name: pk_search[1], type: pk_search[2], hp: pk_search[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
