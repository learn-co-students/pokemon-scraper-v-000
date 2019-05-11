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


end
