class Pokemon
  attr_accessor :id, :name, :type, :db

  #https://robots.thoughtbot.com/ruby-2-keyword-arguments
  def initialize(id:, name:, type:, db:)
    @id =id, @name = name, @type = type, @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end # save

  # def self.find(id_num, db)
  #   pokemon_data = db.execute("SELECT * FROM pokemon where id = ?", id_num).flatten
  #   binding.pry
  #   Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db: db)
  # end # find

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end

end # Pokemon
