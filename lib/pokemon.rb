class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self
    # self.save(@id, @name, @type, @db)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type )
  end

  def self.find(id, db)
    self.all.detect do |pokemon|
      if pokemon.id == id
        # binding.pry
        self.new(id: pokemon.id, name: pokemon.name, type: pokemon.type, db: pokemon.db, hp: pokemon.hp)
        db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);")
        # self.save(pokemon.name, pokemon.type, pokemon.db)
      end
    end
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp - new_hp} WHERE hp = hp")
  end

end
