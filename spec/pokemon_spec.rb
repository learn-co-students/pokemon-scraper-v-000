require_relative "spec_helper"

describe "Pokemon" do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_schema_migration_sql
    scraper = Scraper.new(@db)
    scraper.scrape
  end

  describe "has caught all 151 from scraping" do
    it "has all 151 pokemon" do
      expect(@db.execute("SELECT COUNT(*) FROM pokemon").flatten.first).to eq(151)
    end

    it "knows all the information about Horsea" do
      expect(@db.execute("SELECT * FROM pokemon WHERE name = 'Horsea'").flatten).to eq([116, "Horsea", "Water"])
    end

    it "knows Psyduck is the 54th pokemon" do
      expect(@db.execute("SELECT id FROM pokemon WHERE name = 'Psyduck'").flatten.first).to eq(54)
    end

    it "knows pokemon with the id 143 is Snorlax" do
      expect(@db.execute("SELECT name FROM pokemon WHERE id = 143").flatten.first).to eq("Snorlax")
    end

    it "knows Charmander's type is fire" do
      expect(@db.execute("SELECT type FROM pokemon WHERE name = 'Charmander'").flatten.first).to eq("Fire")
    end
  end

  describe "saving more pokemon to the database" do
    before do
      Pokemon.save("Togepi", "Fairy", @db)
    end

    it "knows the pokemon count increases" do
      expect(@db.execute("SELECT COUNT(*) FROM pokemon").flatten.first).to eq(152)
    end

    it "has Togepi as the last pokemon" do
      expect(@db.execute("SELECT name FROM pokemon ORDER BY id DESC LIMIT 1").flatten.first).to eq("Togepi")
    end
  end

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
    it "alters Pickachu's hp to 59" do
      pikachu.alter_hp(59)
      expect(@db.execute("SELECT hp FROM pokemon WHERE id = 25").flatten.first).to eq(59)
    end

    # Now we alter Magikarp's hp
    it "alters Magikarp's hp" do
      magikarp.alter_hp(0)
      expect(@db.execute("SELECT hp FROM pokemon WHERE id = 129").flatten.first).to eq(0)
    end

    # The pokemon battle has now been won, and you are the Pokemon and SQL Master!

  end
end
