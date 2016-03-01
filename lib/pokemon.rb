class Pokemon
  attr_accessor :id, :name, :type, :db
  @@id=1

  def initialize(id, pk_name, pk_type, db)
   @id=id
   @name=pk_name
   @type=pk_type
   @db=db
  end

  def self.save(pk_name, pk_type, db)
    poke = self.new(@@id, pk_name, pk_type, db)
    @@id += 1
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [poke.name, poke.type])
    poke
  end

  def self.find(pk_id, db)
     db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?) ", [pk_id])[0]
  end
end#end class
