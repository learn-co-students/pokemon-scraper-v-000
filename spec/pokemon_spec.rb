require_relative "spec_helper"

describe "Pokemon" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @db.execute("DROP TABLE IF EXISTS pokemon")
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_migration_sql
  end

  let(:pokemon) {Pokemon.new(1, "Pikachu", "fire", @db)}

  describe ".initialize" do
    it 'is initialized with a name, type and db' do
      expect(pokemon).to respond_to(:id)
      expect(pokemon).to respond_to(:name)
      expect(pokemon).to respond_to(:type)
      expect(pokemon).to respond_to(:db)
    end
  end

  describe ".save" do
    it 'saves an instance of a pokemon with the correct id' do
      Pokemon.save("Pikachu", "fire", @db)

      pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
      expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
    end
  end

  describe ".find" do
    it 'finds a pokemon from the database' do
      Pokemon.save("Pikachu", "fire", @db)

      pikachu_from_db = Pokemon.find(1, @db)
      expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
    end
  end
=begin
  describe "BONUS" do
    # The find method creates a new Pokemon after selecting their row from the database by their id number.
    let(:pikachu){Pokemon.find(25, @db)}
    let(:magikarp){Pokemon.find(129, @db)}

    before do
      @sql_runner.execute_create_hp_column
    end

    it "knows that a pokemon have a default hp of 60" do
          expect(@db.execute("SELECT hp FROM pokemon WHERE id = 1").flatten.first).to eq(60)
        end

        # So Ian and you have decided to battle.  He chose Magikarp (rookie mistake), and you chose Pikachu.
        # He used splash. It wasn't very effective. It did one damage.
        it "alters Pikachu's hp to 59" do
          pikachu.alter_hp(59)
          expect(@db.execute("SELECT hp FROM pokemon WHERE id = 25").flatten.first).to eq(59)
        end

        # Now we alter Magikarp's hp
        it "alters Magikarp's hp" do
          magikarp.alter_hp(0)
          expect(@db.execute("SELECT hp FROM pokemon WHERE id = 129").flatten.first).to eq(0)
        end
        #come back to this at the end of ORM
        # The pokemon battle has now been won, and you are the Pokemon and SQL Master!
    end
=end
end
