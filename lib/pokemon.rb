class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id=?", id).map do |row|
      Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
    end.first 
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end


  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
