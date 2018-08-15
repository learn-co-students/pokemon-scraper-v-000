class Pokemon
  attr_accessor :id, :name , :type, :hp, :db

  def initialize(id:, name:, type:, hp:nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp,  db
  end

  def self.save(name, type, db)
    #ins = db.prepare('insert into pokemon (name, type) values (\'#{name}\', \'#{type}\')')
    #String.each { |s| ins.execute(s) }
    db.execute('insert into pokemon (name, type) values (?,?)',[name, type])
  end

  def self.find(id, db)
    #ins = db.prepare('select * from pokemon where id= \'#{id}\'')
    #String.each { |s| ins.execute(s) }
    array=db.execute('select * from pokemon where id=?', id).flatten
    Pokemon.new(id:array[0], name:array[1], type:array[2], hp:array[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    poke =Pokemon.find(1, db)
  end
end
