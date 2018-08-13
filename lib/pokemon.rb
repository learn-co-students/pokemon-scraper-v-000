require 'pry'
# @@all = []

class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
    # @@all << [@id, @name, @type, @db]
    # binding.pry
    # id = execute "CREATE SEQUENCE pokemonid OWNED BY pokewmon.pokemon INCREMENT BY 1 START WITH 0"
  end



  def self.find(name, db)
    value = db.execute("SELECT * FROM Pokemon WHERE id IS NOT NULL;").flatten
    id = value[0]
    name = value[1]
    type = value[2]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end
  #
  # def bonus
  #   db.execute('ALTER TABLE pokemon ENABLE TRIGGER pause;')
  #   db.execute('ALTER TABLE pokemon ADD hp VARCHAR(200) DEFAULT 60;')
  #   db.execute('UPDATE pokemon SET hp=59 WHERE POKEMON = "pikachu";')
  #   db.execute('UPDATE pokemon SET hp=59 WHERE POKEMON = "magikarp";')
  #   db.execute('ALTER TABLE pokemon DISABLE TRIGGER pause;')
  end

  # def self.find(name, type, db)
  #   db.execute "SELECT id FROM Pokemon WHERE id IS NOT NULL RETURN Pokemon;"
# return Pokemon.new(name, type)
    # pokemon = Pokemon.find(id)
    # RETURN pokemon;'

  # def bonus
  #   db.execute('ALTER TABLE pokemon ADD hp VARCHAR(200) DEFAULT 60;')
  # end
