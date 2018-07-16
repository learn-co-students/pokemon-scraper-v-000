class Pokemon

  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize (id: nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = []
    db.each do |pokemon|
      if pokemon.id == id
        new_pokemon << pokemon
      end
    end
    new_pokemon
  end




end
