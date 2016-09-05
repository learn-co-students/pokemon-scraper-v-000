require_relative "spec_helper"

describe "Pokemon" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @db.execute("DROP TABLE IF EXISTS pokemon")
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_migration_sql
  end

  let(:pokemon) {Pokemon.new(1, "Pikachu", "fire", @db)}

  #seriously guys, fire???
  describe ".initialize" do
    it 'is initialized with an id, name, type and db' do
      expect(pokemon).to respond_to(:id)
      expect(pokemon).to respond_to(:name)
      expect(pokemon).to respond_to(:type)
      expect(pokemon).to respond_to(:db)
    end
  end

  describe ".save" do
    it 'saves an instance of a pokemon with the correct id' do
      Pokemon.save(1, "Pikachu", "fire", @db)

      pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
      expect(pikachu_from_db).to eq([[1, "Pikachu", "fire", 60]])
    end
  end

  describe ".find" do
    it 'finds a pokemon from the database' do
      Pokemon.save(1, "Pikachu", "fire", @db)

      pikachu_from_db = Pokemon.find(1, @db)
      expect(pikachu_from_db.id).to eq(1)
      expect(pikachu_from_db.name).to eq("Pikachu")
      expect(pikachu_from_db.type).to eq("fire")
    end
  end

  describe "BONUS" do
    # The find method creates a new Pokemon after selecting their row from the database by their id number.


      before do
        @db = SQLite3::Database.new(':memory:')
        @db.execute("DROP TABLE IF EXISTS pokemon")
        @sql_runner = SQLRunner.new(@db)
        @sql_runner.execute_schema_migration_sql
      end

    it "knows that a pokemon have a default hp of 60" do
      #pending "Implement the bonus section of the README. Then remove this line."
      Pokemon.save(1, "Pikachu", "fire", @db)
      result = @db.execute("SELECT * FROM pokemon;")
      expect(result.flatten.last).to eq(60)

    end

    # So Ian and you have decided to battle.  He chose Magikarp (rookie mistake), and you chose Pikachu.
    # He used splash. It wasn't very effective. It did one damage.
    it "alters Pikachu's hp to 59" do
      #pending "Implement the bonus section of the README. Then remove this line."
      Pokemon.save(25, "Pikachu", "elctric", @db)
      pikachu = Pokemon.find(25, @db)
      pikachu.alter_hp(25, 59)
      result = @db.execute("SELECT * FROM pokemon;")
      expect(@db.execute("SELECT hp FROM pokemon WHERE ID = '25'").flatten.first).to eq(59)
    end

    # Now we alter Magikarp's hp
    it "alters Magikarp's hp" do
      #pending "Implement the bonus section of the README. Then remove this line."
      Pokemon.save(129, "Magikarp", "water", @db)
      magikarp = Pokemon.find(129, @db)
      magikarp.alter_hp(129, 0)
      expect(@db.execute("SELECT hp FROM pokemon WHERE ID = '129'").flatten.first).to eq(0)
    end
  end
end
