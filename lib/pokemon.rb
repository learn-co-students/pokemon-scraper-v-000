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


   def self.find(id,db)
      find_1 = db.execute("SELECT * FROM pokemon WHERE id  = ?", id).flatten
      self.new(id: find_1[0], name: find_1[1], type: find_1[2], db: db, hp: find_1[3])
   end


   def alter_hp(hp,db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
   end


end
