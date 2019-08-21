class Pokemon #Pokemon .initialize is initialized with keyword arguments of name, type and db
attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
        @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

# THIS IS A SAVE METHOD that handles the common action of INSERTing data into the database.
def self.save(name, type, db) #saves an instance of a pokemon with the correct id
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


def self.find(id_num, db) #finds a pokemon from the database by their id number and returns a new Pokemon object
  pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
      Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
end

def alter_hp(new_hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
end

end
