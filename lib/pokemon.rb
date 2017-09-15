require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp=nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", pk_name, pk_type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten.first
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id)[0][0]
    # hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten.first
    Pokemon.new(id: id, name: name, type: type, db: db)
  end

end

# describe "BONUS" do
#
#   before do
#     @sql_runner.execute_create_hp_column
#     Pokemon.save('Pikachu', 'electric', @db)
#     Pokemon.save('Magikarp', 'water', @db)
#   end
#
#   let(:pikachu){Pokemon.find(1, @db)}
#   let(:magikarp){Pokemon.find(2, @db)}
#
#   # remove the 'x' before 'it' to run these tests
#   it "knows that a pokemon have a default hp of 60" do
#     # The find method should create a new Pokemon object with an id, type, name AND
# =>    hp after selecting their row from the database by their id number.
#     # remember to also update the initialize method to accept an argument of hp
      #that defaults to nil if not set (so it still passes the non-bonus tests)
#     expect(@db.execute("SELECT hp FROM pokemon").flatten.first).to eq(60)
#   end
#
#   # So Ian and you have decided to battle.  He chose Magikarp (rookie mistake), and you chose Pikachu.
#   # He used splash. It wasn't very effective. It did one damage.
#   it "alters Pikachu's hp to 59" do
#     pikachu.alter_hp(59, @db)
#     expect(Pokemon.find(1, @db).hp).to eq(59)
#   end
#
#   # Now we alter Magikarp's hp
#   it "alters Magikarp's hp" do
#     magikarp.alter_hp(0, @db)
#     expect(Pokemon.find(2, @db).hp).to eq(0)
#   end
