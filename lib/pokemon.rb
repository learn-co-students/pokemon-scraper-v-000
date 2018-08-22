class Pokemon

attr_accessor :id, :name, :type, :db

#they keyword arguments aka key value pairs => they are set up to acccept the values in the test
  def initialize(name:, type:, db:, id:) #instance is initialized with keyword arguments of name, type and db
    #how does id get populated? by us manually or autoincremented in the database?
    @db = db #what exactly is going into this value? look at spec --> @db = SQLite3::Database.new(':memory:')
    @id = id
    @name = name
    @type = type
  end

  #what tells Ruby that Pokemon = tablename? where is that code?
  def self.save (name, type, db)#why does it need to work at Class level?
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
      #sql injection not string interpolation. takes sql statement and values that you want to put in into database
  end

  def self.find(id_num, db)
    #why does this come back as a nested array?
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2],db: db)
    #you must give it the argument of db because that is an attribute of an event instance
  end





end
