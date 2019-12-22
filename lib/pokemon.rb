class Pokemon
  #is initialized with keyword arguments of name, type and db (FAILED - 1)
  attr_accessor :id, :name, :type, :hp, :db
  def initialize(id:, name:, type:, hp:nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end
end
#http://ruby.bastardsbook.com/chapters/sql/
