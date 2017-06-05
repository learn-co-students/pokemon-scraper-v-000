require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id
  @@all = []
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    # id = db.execute("SELECT MAX(id) FROM pokemon")[0]
    # # pk = Pokemon.new(id:id, name:name, type:type, db:db)
    # # @@all<<pk
  end

  def self.find(id,db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    # binding.pry
    new_pk = Pokemon.new(id:pk[0][0], name:pk[0][1], type:pk[0][2], db:db)
    new_pk
  end



end
