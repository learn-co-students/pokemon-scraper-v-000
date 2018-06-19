require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @id = id
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    info = {id: info[0], name: info[1], type: info[2], db: db}
    # binding.pry
    self.new(info)
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, id)
  end
end
