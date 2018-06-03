class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(id:"1", name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    find_specs = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    new_poke = self.new(:id => find_specs.first[0], :name => find_specs.first[1], :type => find_specs.first[2], :db => db)
    new_poke
  end


end
