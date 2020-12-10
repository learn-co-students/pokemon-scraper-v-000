class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all =[]

  def initialize(id: nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    var = db.execute("SELECT pokemon.* FROM pokemon").flatten
    Pokemon.new(id: var[0], name: var[1], type:var[2])
  end

  def alter_hp(hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = #{hp}
    WHERE name = #{name}")
    # @hp = hp

  end

end
