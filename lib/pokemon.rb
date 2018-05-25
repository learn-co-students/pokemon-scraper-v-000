

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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end


  def self.find(id, db)
    # @pokemon  = db.execute(
    # "
    # SELECT *
    # FROM pokemon
    # WHERE id = id
    #
    # "
    # )

    info = db.execute(("SELECT * FROM pokemon WHERE id = ?"), id).flatten
  # self.save(@pokemon[0][2], @pokemon[0][3], db)
  # binding.pry

    # Pokemon.new(info[0], info[1], info[2], db)
    Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
 # binding.pry
    # pokemon = Pokemon.new(@pokemon[0][1], @pokemon[0][2], @pokemon[0][3], db)
    # binding.pry
    #
    # Pokemon.new(@pokemon[0][1], @pokemon[0][2], @pokemon[0][3])
  end

end
