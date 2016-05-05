class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id,name,type,db)
    @id= id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, action, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, action)
  end

  def self.find(name,db)
      db.execute("SELECT * FROM pokemon WHERE name = name")
  end


#   describe ".find" do
#     it 'finds a pokemon from the database' do
#       newer_pokemon = Pokemon.save("Pikachu", "fire", @db)

#       pikachu_from_db = Pokemon.find(1, @db)
#       expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
#     end
#   end

#   describe ".save" do
#     it 'saves an instance of a pokemon with the correct id' do
#       new_pokemon = Pokemon.save("Pikachu", "fire", @db)

#       pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
#       expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
#     end
#   end

end
