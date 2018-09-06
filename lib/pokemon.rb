class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def initialize(name: , type: , db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(pk_name, pk_type, db)

    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pk_name, pk_type)
  end

  def self.find(id, db)
    found_pk = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    return self.new(id: id, db: db, name: found_pk[0][1], type: found_pk[0][2], hp: found_pk[0][3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
