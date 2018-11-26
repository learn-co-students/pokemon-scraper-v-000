require_relative "spec_helper"

describe "Pokemon" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @db.execute("DROP TABLE IF EXISTS pokemon")
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_migration_sql
  end

  let(:pokemon) {Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)}

  describe ".initialize" do
    it 'is initialized with keyword arguments of id, name, type and db' do
      expect(pokemon).to respond_to(:id)
      expect(pokemon).to respond_to(:name)
      expect(pokemon).to respond_to(:type)
      expect(pokemon).to respond_to(:db)
    end
  end

  describe ".save" do
    it 'saves an instance of a pokemon with the correct id' do
      Pokemon.save("Pikachu", "electric", @db)

      pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
      expect(pikachu_from_db).to eq([[1, "Pikachu", "electric"]])
    end
  end

  describe ".find" do
    it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
      # The find method creates a new Pokemon after selecting their row from the database by their id number.
      Pokemon.save("Pikachu", "electric", @db)

      pikachu_from_db = Pokemon.find(1, @db)
      expect(pikachu_from_db.id).to eq(1)
      expect(pikachu_from_db.name).to eq("Pikachu")
      expect(pikachu_from_db.type).to eq("electric")
    end
  end

  #describe "BONUS" do

    #before do
     # @sql_runner.execute_create_hp_column
     # Pokemon.save('Pikachu', 'electric', @db)
     # Pokemon.save('Magikarp', 'water', @db)
    #end

    #let(:pikachu){Pokemon.find(1, @db)}
    #let(:magikarp){Pokemon.find(2, @db)}

    # remove the 'x' before 'it' to run these tests
    #xit "knows that a pokemon have a default hp of 60" do
      # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database by their id number.
      # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
      #expect(@db.execute("SELECT hp FROM pokemon").flatten.first).to eq(60)
    ##end

    # So Ian and you have decided to battle.  He chose Magikarp (rookie mistake), and you chose Pikachu.
    # He used splash. It wasn't very effective. It did one damage.
    #xit "alters Pikachu's hp to 59" do
      #pikachu.alter_hp(59, @db)
      #expect(Pokemon.find(1, @db).hp).to eq(59)
    #end

    # Now we alter Magikarp's hp
   # xit "alters Magikarp's hp" do
     # magikarp.alter_hp(0, @db)
     # expect(Pokemon.find(2, @db).hp).to eq(0)
    #end
  #end
end
