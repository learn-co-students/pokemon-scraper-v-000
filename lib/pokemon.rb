class Pokemon
  attr_accessor :name, :id, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save
    sql = <<-SQL
      INSERT INTO pokemons (name, type)
      VALUES (?, ?)
    SQL

    @db[:conn].execute(sql, self.name, self.type)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemons")[0][0][0]
  end

  def find
  end
end
