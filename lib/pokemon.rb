class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?,?)", name, type)
  end

  def self.find(id_, db)
    info_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id_).flatten
    Pokemon.new(id: info_array[0], name: info_array[1], type: info_array[2], hp: info_array[3], db: db)
  end

  def alter_hp(hp_num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_num, self.id)
  end
end
