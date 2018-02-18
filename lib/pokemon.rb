require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

 def self.save(name, type, db)
   db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
 end

 # describe ".find" do
 #   it 'finds a pokemon from the database by their id number and returns a new Pokemon object' do
 #     # The find method creates a new Pokemon after selecting their row from the database by their id number.
 #     Pokemon.save("Pikachu", "electric", @db)
 #
 #     pikachu_from_db = Pokemon.find(1, @db)
 #     expect(pikachu_from_db.id).to eq(1)
 #     expect(pikachu_from_db.name).to eq("Pikachu")
 #     expect(pikachu_from_db.type).to eq("electric")
 #   end

 def self.find(id, db)
   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
   self.new(:id=>pokemon_info[0], :name=>pokemon_info[1], :type=>pokemon_info[2], :hp => pokemon_info[3], :db=>db)
 end

 def alter_hp(hp, db)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
 end

end


# class Pokemon
#   attr_accessor :id, :name, :type, :hp, :db
#
#   def self.save(name, type, db)
#     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end
#
#   def self.find(id_num, db)
#     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
#     Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
#   end
#
#   def initialize(id:, name:, type:, hp: nil, db:)
#     @id, @name, @type, @hp, @db = id, name, type, hp, db
#   end
#
#   def alter_hp(new_hp, db)
#     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
#   end
# end
