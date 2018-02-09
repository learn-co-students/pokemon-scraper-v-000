class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(ar, hp=nil)
    @id=ar[0]
    @name=ar[1]
    @type=ar[2]
    @hp=hp
  end

  def alter_hp(hp, db)
    @hp=hp
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end

  def self.save(name, type, db, hp=60)
    begin
      db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)",name, type, hp)
    rescue
      db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end
  end

  def self.find(id, db)
    begin
      ar=db.execute("SELECT id, name, type, hp FROM pokemon WHERE id = (?)", id)
    rescue
      ar_r=db.execute("SELECT id, name, type FROM pokemon WHERE id = (?)", id)
      Pokemon.new(ar_r[0], @hp)
    else
      Pokemon.new(ar[0], ar[0][3])
    end
  end
end
