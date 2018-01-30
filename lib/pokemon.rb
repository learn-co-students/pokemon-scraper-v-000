class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(name, type, pkm_db)
    pkm_db.execute("INSERT INTO pokemon (name,type) VALUES(?,?)", name, type)
  end

  def self.find(id,pkm_db)
    new_pkm_obj = pkm_db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    self.new(id: new_pkm_obj[0], name: new_pkm_obj[1],type: new_pkm_obj[2], hp: new_pkm_obj[3] ,db: pkm_db)
  end

  def alter_hp(hp, pkm_db)
    pkm_db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
