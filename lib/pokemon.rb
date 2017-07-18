require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db
 
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pk_id, db)
    pk_info = db.execute("SELECT * FROM pokemon WHERE id=?", pk_id).flatten
    Pokemon.new(id: pk_info[0], name: pk_info[1], type: pk_info[2], db: db)
  end
end

