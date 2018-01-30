require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :quantity

  def initialize(quantity, name, type, db)
    @quantity = quantity
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) values ('#{name}', '#{type}');")
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = #{id};").first
  end


end
