class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp:60, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute('insert into pokemon (name, type) values (?, ?)', name, type)
  end

  def self.find(id_num,db)
    info = db.execute('select * from pokemon where id=?', id_num).flatten
    Pokemon.new(id:info[0],name:info[1],type:info[2],hp:info[3],db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("update pokemon set hp = ? where id = ?", new_hp, self.id)
  end
end
