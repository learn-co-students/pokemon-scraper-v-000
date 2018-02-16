class Pokemon
   attr_accessor :id, :name, :type, :hp, :db

   def initialize(attributes = nil)
      unless attributes.nil?
         attributes.each do |key, value|
            send("#{key}=", value)
         end
      end
   end

   def alter_hp(hp, db)
      db.execute('UPDATE pokemon SET hp = ? where id = ?', [hp, @id])
   end

   def self.save(name, type, db)
      db.execute('INSERT INTO pokemon ( name, type) VALUES ( ?, ?)', [name, type])
   end

   def self.find(id, db)
      pokemon = Pokemon.new
      pokemon.id, pokemon.name, pokemon.type, pokemon.hp = db.execute('SELECT * from pokemon where id = ( ?)', [id]).flatten
      pokemon
   end
end
