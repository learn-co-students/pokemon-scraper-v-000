class Pokemon

  attr_accessor :name, :type, :db, :id



  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    #Pokemon.save
  end



  def self.create_table
    sql =  <<-SQL
    CREATE TABLE IF NOT EXISTS pokemon(
    id INTEGER PRIMARY KEY,
    name TEXT,
    type TEXT
    )
    SQL
    DB[:conn].execute(sql)
  end


  def self.save (name, type, db)
    sql =  <<-SQL
    INSERT INTO pokemon(name,type)
    VALUES (?,?)
    SQL

    db.execute(sql,name,type)

  #  @id = DB[:conn].execute("SELECT last_inserted() FROM pokemon")[0][0]
  end

  def self.find(id, db)
  local_db = db.execute("SELECT * FROM pokemon  WHERE id = ?",id).flatten
   Pokemon.new(id:local_db[0],name:local_db[1],type:local_db[2],db:db)
  end

end
