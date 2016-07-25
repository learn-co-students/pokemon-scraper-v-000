require "pry"

class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize id, name, type, db
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save name, type, db
    prepped = db.prepare("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    prepped.execute
  end

  def self.find id, db
    db.execute("SELECT * FROM pokemon WHERE id = #{id}")
  end

  def alter_hp hp
    self.db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id} ")
  end

end
