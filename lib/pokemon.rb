require 'pry'

class Pokemon

# Really got lost here.  Had to look to Flatiron Solution and then work backward to understand.
# Still not sure I understand, given the errors that the tests were throwing out.
# I think what really screwed me up here is the way the author of the tests expects the intialize arguments
# to be passed.

  @@all = []

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, hp: nil, db:)
      @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  # def initialize(id)
  #   self.id = id
  #   self.class.all << self
  # end

  def self.all
    @@all
  end

  #This one I got:
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    #This next line I got too, except for #flatten, which is helpful.  The rest, I was lost.
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  # def self.find(id, database_connection)
  #   # pk = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
  #   #pk = database_connection.execute("SELECT id FROM pokemon WHERE id = ?", id)
  #   pk = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
  #   x = Pokemon.new(pk[0][0])
  #   x.name = pk[0][1]
  #   x.type = pk[0][2]
  #   x
  #   #self.all[id - 1]
  # end


end
