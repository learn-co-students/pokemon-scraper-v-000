require 'pry'
class Pokemon
  attr_accessor :name, :type, :db
  def initialize(nu = nil, name="Default", type="=default", db)
    @name = name
    @type = type
    @db = db
    #binding.pry
  end

  def self.save(name, type, db)
    new_poke = Pokemon.new(1, name, type, db)
    db.execute( "INSERT INTO Pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end

  def self.find(nu, db)
    a =db.execute( "SELECT * FROM Pokemon WHERE id = (?)", nu)
    a.flatten
  end
end
