
class Pokemon
attr_accessor :id, :name, :type, :db

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?, ? )", name, type)

  end

  def self.find(id, db)
    #selects the pokemon from the table base on the id. results are in array form
  pokemon_array = db.execute("SELECT * FROM Pokemon WHERE id=?",id).flatten!

      #creates an instance by creating a hash and creating an instance
   new_pokemon = self.new({id:pokemon_array[0], name:pokemon_array[1],
   type:pokemon_array[2],db:db})


 end

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end




end
