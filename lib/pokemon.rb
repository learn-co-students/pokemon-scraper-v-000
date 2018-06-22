require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)",name,type)
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    Pokemon.new(id: poke_info[0], name: poke_info[1], type: poke_info[2], db: db)
  end
end
