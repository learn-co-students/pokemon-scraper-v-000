class Pokemon
  attr_accessor :id, :name, :type, :db
  ALL = []

  def initialize(attributes)
    attributes.each { |attribute, value| send("#{attribute}=", value) }
    ALL << self
  end

  def self.save(name, type, db)
    poke = ALL.detect { |p| p.name == name && p.type == type }
    db.query("INSERT INTO pokemon (id, name, type) values (?, ?, ?)", [poke.id, poke.name, poke.type])
  end

  def self.find(id, db)
    poke_hash = db.query("SELECT * FROM pokemon WHERE id = ?", [id]).next_hash
    new(poke_hash)
  end
end
