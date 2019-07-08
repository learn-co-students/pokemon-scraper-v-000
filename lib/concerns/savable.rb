module Savable
  module ClassMethods

     def all
         self.class_variable_get("@@all")
     end

     def clear
         self.all.clear
     end


    def save(name, type, db)
      pokemon = self.create_or_update_from_data({name: name, type: type, db: db})
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [pokemon.name, pokemon.type])
    end

 end

 module InstanceMethods

 end
end
