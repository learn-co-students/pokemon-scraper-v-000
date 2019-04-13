class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]
  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
  end

  def self.find(id, db)
    args = db.execute("select * from pokemon where id = ?", id)
    name = args[0][1]
    type = args[0][2]
    if args[0].size == 4
      hp = args[0][3]
    end
    #binding.pry
    Pokemon.new({:id => id, :name => name, :type => type, :db => db, :hp => hp})
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("update pokemon set hp = ? where id = ?", hp, @id)
    #binding.pry
  end

end
