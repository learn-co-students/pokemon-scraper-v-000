
class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find (id_num, db)
    pk_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pk_info[0], name: pk_info[1], type: pk_info[2], hp: pk_info[3], db: db)
  end

  def alter_hp (new_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?",new_hp,self.id)
  end

end


=begin
class Cat
  @@all = []
  def initialize(name, breed, age)
    @name = name
    @breed = breed
    @age = age
    @@all << self
  end
  def self.all
    @@all
  end
  def self.save(name, breed, age, database_connection)
    database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
  end
end
database_connection = SQLite3::Database.new('db/pets.db')
Cat.new("Maru", "scottish fold", 3)
Cat.new("Hana", "tortoiseshell", 1)
Cat.all.each do |cat|
  Cat.save(cat.name, cat.breed, cat.age, database_connection)
end

=end
