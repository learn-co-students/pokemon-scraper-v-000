class Pokemon


  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def self.all
    @@all
  end

  #can create a new Pokemon object with keyword arguments to ensure data is input in the right order, then pushes pokemon object into a class variable

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  #creates a new pokemon instance and saves it's data into a given database in the form of a new row

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

#this might break if we add or delete columns from db at some point... how can i fix that?
#finds the pokemon in a db with the given id, and creates a new pokemon object utilising the data in the database
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: id, name: pokemon[0][1], type: pokemon[0][2], db: db, hp: pokemon[0][3])
  end

#finds the object with the name "pikachu" in our Pokemon class, changes pikachu's hp property
  def alter_hp(new_hp, db)
      # binding.pry
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
