class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name= name
    @id= id
    @type= type
    @db= db

  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values (?,?)", name, type)
  end

  def self.find(id, db)
    results = db.execute("select * from pokemon where id = ?", id).flatten
    Pokemon.new(:id => results[0], :name => results[1], :type => results[2], :db=> db)
  end
end
