class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

 def initialize(id:, name:, type:, db: db = nil, hp: hp=nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
 end

 def self.all
    @@all
 end

 def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}','#{type}')")
 end
 
 def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'").flatten
    Pokemon.new(id: array[0], name: array[1], type: array[2], hp: array[3])
 end

 def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.name = ?", hp, self.name)
 end 

end
