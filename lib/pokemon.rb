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

#get the row back from the database
statement = db.prepare("SELECT * FROM pokemon where id = ?;")
statement.bind_params(id)
result = statement.execute

#iterate through the result in such a way that:
#1) multiple rows can be handled
#2) that we don't rely on the order of the columns to set our isntance variables, we can isntead actually "read" them
#   and be sure the right columns get to the right instance variables'
poke_array = []
result.each_hash {|this_hash| 
                              new_poke = Pokemon.new(id: 9, name: "default", type: "defaulte", db: db)
                              
                              this_hash.each {|key,value|
                                                        
                                                        #if this is the id column, you store as an integer rather than 
                                                        #an interpolated string
                                                        if key != "id"
                                                        new_poke.instance_variable_set("@#{key}", "#{value}")
                                                        else
                                                        new_poke.instance_variable_set("@#{key}", value)
                                                        end
                                            }
                              poke_array << new_poke
                 }
#return the found results (in this case just one of them, but could be built to dynamically decide how many to return)
poke_array[0]

end


#end of class
end
