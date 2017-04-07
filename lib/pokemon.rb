class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize (name:, type:, db:, id:, hp:nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    new_pkmon_specs = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    new(name:new_pkmon_specs[1], type: new_pkmon_specs[2], db: db, id: new_pkmon_specs[0], hp: new_pkmon_specs[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, @id)
    @hp=hp
  end
end
