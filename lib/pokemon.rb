class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', [name, type])
  end

  def self.find(id, db)
    pokemon = db.execute('SELECT * FROM pokemon WHERE id = ?', id).first
    new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def initialize(id:, name:, type:, db:, hp: nil)
    self.id   = id
    self.name = name
    self.type = type
    self.db   = db
    self.hp   = hp
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', hp, id)
  end
end
