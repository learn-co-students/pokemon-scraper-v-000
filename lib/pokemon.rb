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
    found_pk = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
    return self.new(id: id, db: db, name: found_pk[0][0], type: found_pk[0][1], hp: found_pk[0][2])
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end
end
