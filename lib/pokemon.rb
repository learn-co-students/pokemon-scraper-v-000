require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize (id:,name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    find = db.execute("SELECT *  FROM pokemon WHERE id = ?", [id]).flatten
    self.new(id: find[0], name: find[1], type: find[2], db: db)

    #puts("hello world")
    #binding.pry
  end

end
