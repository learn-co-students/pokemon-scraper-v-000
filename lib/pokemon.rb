require 'pry'
class Pokemon

  attr_accessor :name, :type, :id, :db



  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(pok_id, db)

    this = db.execute("SELECT * FROM pokemon WHERE id = #{pok_id}")
    Pokemon.new(id:this.flatten[0], name:this.flatten[1], type:this.flatten[2], db:db)
  end
end
