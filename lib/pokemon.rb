class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize (id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
end

def self.all
  @@all
end

#save method inserts data into the database
def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

def self.find(id, db)
  pk_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten #flatten will extract its elements into the new array
  self.new(id: pk_array[0], name: pk_array[1], type: pk_array[2], hp: pk_array[3], db: db)
end

#will allow us to change a specific pokemon's health to a new hp. It will need to take a new health power as a parameter.
def alter_hp(new_hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE ID = ?", new_hp, self.id)
end


end
