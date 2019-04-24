require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = [ ]

  def initialize(id:, name:,type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all

  end

   def self.save(name,type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

 # for self.find method, it return array every attribute from the pokeman table where each colume value is included in an array.
 # then we select each of the index.. Aka return each of the roll with they values added
   def self.find(id,db)
      rolls_in_colums = db.execute("SELECT * FROM pokemon WHERE id  = ?", id).flatten
      self.new(id: rolls_in_colums[0], name: rolls_in_colums[1], type: rolls_in_colums[2], db: db, hp: rolls_in_colums[3])
   end

   def alter_hp(hp,db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
   end

end
