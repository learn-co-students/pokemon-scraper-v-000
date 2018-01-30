require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
 
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pk_id, db)
    pk_info = db.execute("SELECT * FROM pokemon WHERE id=?", pk_id).flatten
    Pokemon.new(id: pk_info[0], name: pk_info[1], type: pk_info[2], hp: pk_info[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
  end
end

