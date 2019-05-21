class Pokemon

   attr_accessor :id, :name, :type, :db, :hp

   def initialize(id:, name:, type:, db:, hp:nil)
       @name = name
       @type = type
       @db = db
       @id = id
       @hp = hp
     end

   def self.create_table
   	sql = <<-SQL
   		CREATE TABLE IF NOT EXISTS pokemon (
   		id INTEGER PRIMARY KEY,
   		name TEXT,
   		typer TEXT
   		)
   	SQL
   	@db.execute(sql)
   end

   def self.save(name, type, db)

   	db.execute("INSERT INTO pokemon (name, type)
   		VALUES ( ?, ?)", name, type)

   end

   def self.find(id, db)
   	create_this_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
   	poke = Pokemon.new(id: create_this_pokemon[0], name: create_this_pokemon[1], type: create_this_pokemon[2], hp: create_this_pokemon[3], db: db)
   	poke
   end

   def alter_hp(hp, db)
     db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, @id)
   end

end
