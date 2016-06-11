class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id, name, type, db)
    self.db = db
    self.id
    self.name = name
    self.type = type
  end

  def self.save(name, type, db=self.db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?,?);")
    insert.execute(name, type)
  end

  def self.find(id, db=self.db)
  db.execute("SELECT * FROM pokemon WHERE id IN (?);",[id])
  end

end


  # describe ".save" do
  #   it 'saves an instance of a pokemon with the correct id' do
  #     new_pokemon = Pokemon.save("Pikachu", "fire", @db)

  #     pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
  #     expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
  #   end
  # end

  # describe ".find" do
  #   it 'finds a pokemon from the database' do
  #     newer_pokemon = Pokemon.save("Pikachu", "fire", @db)

  #     pikachu_from_db = Pokemon.find(1, @db)
  #     expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
  #   end
  # end

