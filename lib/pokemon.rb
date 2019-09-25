class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id


  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?) WHERE id = ?
    SQL

    DB[:conn].execute(sql, name, type)
  end

end
