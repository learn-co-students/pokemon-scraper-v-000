class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    output = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    newpoke = Pokemon.new(id: output[0][0], name: output[0][1], type: output[0][2], db: db, hp: output[0][3])
    #puts "id: #{output[0][0]}, name: #{output[0][1]}, type: #{output[0][2]}, db: #{db}"
  end

  def alter_hp(newpower, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", newpower, @id)

  end

end
