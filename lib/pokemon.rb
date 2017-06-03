class Pokemon

#----------------------------------------------------------------------------------------
#macros, vars, attrs
attr_accessor :id, :name, :type, :db


#----------------------------------------------------------------------------------------
#instance
def initialize (id:, name:,type:,db:)
@id = id
@name = name
@type = type
@db = db
end

#----------------------------------------------------------------------------------------
#class
def self.save (name, type, db)
#one method (using the db object rather than statement object below)
# db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);", 1, name, type)

#another method to save (using the statment object)
statement = db.prepare("INSERT INTO pokemon (id, name, type) VALUES (?,?,?);")
statement.bind_params(1,name,type)
statement.execute
end

def self.find (id,db)
db.results_as_hash = true

result = db.execute("SELECT * FROM pokemon where id = ?;", id)

new_poke = Pokemon.new(id: 9, name: "default", type: "defaulte", db: db)

binding.pry
result.each {|key,value| new_poke.instance_variable_set("@#{key}", "#{value}")}

new_poke

end


#end of class
end
