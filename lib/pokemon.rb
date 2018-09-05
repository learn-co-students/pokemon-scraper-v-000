class Pokemon
  attr_accessor :name, :type, :db
  @@all = []

  def initialize(name: "", type: "", db:)
    @name = pk_name
    @type = pk_type
    @db = db
  end

  def self.save(pk_name:, pk_type:, db:)
    self.new

    @db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",@name, @type)
  end
end
