class Pokemon
  attr_accessor :id, :name, :hp, :type, :db

  #https://robots.thoughtbot.com/ruby-2-keyword-arguments
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end # save

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    #binding.pry
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end # find

  def alter_hp(hp, db)
    db.execute("update pokemon set hp = ?", hp )
  end # alter_hp

end # Pokemon
