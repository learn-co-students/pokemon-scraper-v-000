class Pokemon
  attr_accessor :name, :type, :db, :id


  def initialize(name, type, db)
    @name = name
    @type = type
    @db = db


  end

  def self.save(name, type, db)
    #saves instance with correct id
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    pokemon = db.execute(sql, id)
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2])
    # Pokemon.reify_from_row(row).flatten
    # finds based on id, returns a new Pokemon object, selects their row from the db, using the id number
  end

  # def alter(new_health, db)
  #   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_health, self.id)
  # end
end
  #
  # def self.find(id_num, db)
  #   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
  #   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  # end

  # def self.reify_from_row(rows)
  #   rows.collect{|r| reify_from_row(r) }
  # end


 # save, add, remove, change


#
#   def self.save(nam, type, db)# called from scraper class to save the newly scraped instance
#     database_connection.execute  ("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end
# s
#
#   def self.find(id=nil, db)
#     database_connection.execute #find in database
# end
