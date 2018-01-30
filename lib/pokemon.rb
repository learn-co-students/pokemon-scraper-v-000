class Pokemon

  DEFAULT_HP = 60

  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    begin
      db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?);", name, type, DEFAULT_HP)
    rescue
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end
  end

  def self.find(id, db)
    poke_ary = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    poke_hsh = {
      id: poke_ary[0],
      name: poke_ary[1],
      type: poke_ary[2],
      hp: poke_ary[3] || DEFAULT_HP, # in case it was saved before the HP column was added
      db: db
    }
    self.new(poke_hsh)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
