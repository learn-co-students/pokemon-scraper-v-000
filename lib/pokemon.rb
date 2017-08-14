
class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def self.save (name, type, db)
    db.execute("INSERT INTO Pokemon (name, type)
    VALUES (?, ? )", name, type)
  end

  def self.find(id, db, hp=nil)
    #selects the pokemon from the table base on the id. results are in array form
  pokemon_array = db.execute("SELECT * FROM Pokemon WHERE id=?",id).flatten!

      #creates an instance by creating a hash and creating an instance
   new_pokemon = self.new({
   id:pokemon_array[0],
   name:pokemon_array[1],
   type:pokemon_array[2],
   hp:pokemon_array[3],
   db:db })
  end

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    @hp = hash[:hp]
  end

  def alter_hp(hp,db)
    db.execute("UPDATE Pokemon SET hp= ? WHERE id= ?",hp, self.id)
  end



end
