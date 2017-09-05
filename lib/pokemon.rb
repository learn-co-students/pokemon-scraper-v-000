require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(arguments)
    @name = arguments[:name]
    @type = arguments[:type]
    @id = arguments[:id]
    @db = arguments[db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db_query = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    arguments = { :id => db_query[0][0],
    :name => db_query[0][1],
    :type => db_query[0][2] }
    new_object = Pokemon.new(arguments)
    new_object
  end

end
