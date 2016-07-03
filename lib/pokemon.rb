class Pokemon
  attr_reader :db, :id, :name, :type
  def initialize(id, name, type, db)
    @db = db
    #ins = @db.prepare('insert into pokemon (id, name, type) values (?, ?, ?)')
    #binding.pry
    #data.each { |d| ins.execute(d) }
    @id = id
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    ins = db.prepare('insert into pokemon (id, name, type) values (?, ?, ?)')
    ins.execute(@id, name, type)
  end

  def self.find(id, db)
    db.execute('SELECT * FROM pokemon WHERE id = (?)', id).flatten
  end
end
