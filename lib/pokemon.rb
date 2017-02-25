class Pokemon
attr_accessor :id, :name, :type, :db, :hp


  def initialize (id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end


  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id_, db)
    info_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id_).flatten
    Pokemon.new(id: info_array[0], name: info_array[1], type: info_array[2], hp: info_array[3], db: db)
  end

  def alter_hp(hp_num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_num, self.id)
  end

end
