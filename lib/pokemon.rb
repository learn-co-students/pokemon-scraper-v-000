require 'pry'
class Pokemon
  attr_reader :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = #{id.to_i}")
    Pokemon.new(id:array[0][0], name:array[0][1], type:array[0][2], db:db)
  end
end
