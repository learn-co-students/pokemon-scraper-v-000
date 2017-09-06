class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id)
    @id = id
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end
=begin
Pokemon.save("Pikachu", "electric", @db)

pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
expect(pikachu_from_db).to eq([[1, "Pikachu", "electric"]])
=end
end
