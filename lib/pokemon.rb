class Pokemon

#since we are creatind the DB with classes we need to set these up as classes
#must use attr_accessor as we will be reading and writing to and from the database
# We need to add the 'id' as the databse will need the id to locate the items in the database
attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  # Here we are saving the information to be placed into the database
  def self.save(name, type, db)
    #We execute the SQL databse with the INSERT INTO to add pokemon name and type
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_num, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end

  def alter_hp(update_hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', update_hp, self.id)
  end

end
