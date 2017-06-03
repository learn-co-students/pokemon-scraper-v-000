class Pokemon

#----------------------------------------------------------------------------------------
#macros, vars, attrs
attr_accessor :id, :name, :type, :db, :hp


#----------------------------------------------------------------------------------------
#instance
def initialize (id:, name:,type:,db:, hp: 60)
@id = id
@name = name
@type = type
@db = db
end


def alter_hp (hp, db)


end


#----------------------------------------------------------------------------------------
#class
def self.save (name, type, db, hp = 60)
#one method (using the db object rather than statement object below)
# db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?);", 1, name, type)

#the way the tests seem to want you to do this, the id isn't necc. tied to the object id
#so we need to read the "last" id created in the db and ++1 to get the id for the
#save we want to currently do; so that's what I'm doing below when i call
#db.last_insert_row_id
    

#another method to save (using the statment object)
statement = db.prepare("INSERT INTO pokemon (id, name, type, hp) VALUES (?,?,?,?);")
statement.bind_params(db.last_insert_row_id + 1,name,type, hp)
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
                              #adds the hp value
                              new_poke.hp = 60
                              poke_array << new_poke
                 }
#return the found results (in this case just one of them, but could be built to dynamically decide how many to return)
poke_array[0]

end


#end of class
end
