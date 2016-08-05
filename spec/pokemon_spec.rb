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
      new_pokemon = Pokemon.save("Pikachu", "fire", @db)

      pikachu_from_db = @db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu'")
      expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
    end
  end

  describe ".find" do
    it 'finds a pokemon from the database' do
      newer_pokemon = Pokemon.save("Pikachu", "fire", @db)

      pikachu_from_db = Pokemon.find(1, @db)
      expect(pikachu_from_db).to eq([[1, "Pikachu", "fire"]])
    end
  end


end
