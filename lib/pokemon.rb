class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @@all << self
    pokemon
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
    pokemonhash = {id: id, name: name, type: type, db: db}

    newPokemon = Pokemon.new(pokemonhash)
  end

end

#
#   describe ".find" do
#     it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
#       # The find method creates a new Pokemon after selecting their row from the database by their id number.
#       Pokemon.save("Pikachu", "electric", @db)
#
#       pikachu_from_db = Pokemon.find(1, @db)
#       expect(pikachu_from_db.id).to eq(1)
#       expect(pikachu_from_db.name).to eq("Pikachu")
#       expect(pikachu_from_db.type).to eq("electric")
#     end
#   end
#
#   describe "BONUS" do
#
#     before do
#       @sql_runner.execute_create_hp_column
#       Pokemon.save('Pikachu', 'electric', @db)
#       Pokemon.save('Magikarp', 'water', @db)
#     end
#
#     let(:pikachu){Pokemon.find(1, @db)}
#     let(:magikarp){Pokemon.find(2, @db)}
#
#     # remove the 'x' before 'it' to run these tests
#     xit "knows that a pokemon have a default hp of 60" do
#       # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database by their id number.
#       # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
#       expect(@db.execute("SELECT hp FROM pokemon").flatten.first).to eq(60)
#     end
#
#     # So Ian and you have decided to battle.  He chose Magikarp (rookie mistake), and you chose Pikachu.
#     # He used splash. It wasn't very effective. It did one damage.
#     xit "alters Pikachu's hp to 59" do
#       pikachu.alter_hp(59, @db)
#       expect(Pokemon.find(1, @db).hp).to eq(59)
#     end
#
#     # Now we alter Magikarp's hp
#     xit "alters Magikarp's hp" do
#       magikarp.alter_hp(0, @db)
#       expect(Pokemon.find(2, @db).hp).to eq(0)
#     end
#   end
# end
