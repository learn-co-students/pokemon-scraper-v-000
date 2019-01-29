class Pokemon

attr_accessor :name, :type, :db, :id, :hp

def initialize(id:,name:,type:,db:,hp:60)
@id = id
@name = name
@type = type
@hp = hp
@db = db
end

def self.save(name, type, db)
db.execute("insert into pokemon (name,type) values (?,?)",name,type)
end

def self.find(id, db)
array = db.execute("select * from pokemon where pokemon.id = ?;",id).flatten
poke_out = Pokemon.new(id:id,name:array[1],type:array[2],db:db,hp:array[3])
return poke_out
end

def alter_hp(hp,db)
db.execute("UPDATE pokemon SET hp=? WHERE id=?;",hp,self.id)
end

end
