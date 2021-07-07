class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      insert into pokemon (name, type)
      values (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      select *
      from pokemon
      where id = ?
    SQL
    array = db.execute(sql, id)[0]
    self.new(id: array[0], name: array[1], type: array[2], db: db)
  end
end
