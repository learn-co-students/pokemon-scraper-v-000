require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :db


  @@all = []
  def initialize(id: , name: , type: , db: )

    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self

  end

    def self.all
      @@all
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    #binding.pry
    end

    def self.find(id, db)
      pokemon_info = db.execute("SELECT * FROM pokemon  WHERE id = ?", id).flatten

      Pokemon.new(id: 1, name: 'Pikachu', type: 'electric', db: db)

    end

end
