class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id, hp = nil)
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    array = db.execute("SELECT name, type, hp FROM pokemon WHERE id = ?;", id).flatten
      Pokemon.new(id).tap do |pokemon|
      pokemon.name = array[0]
      pokemon.type = array[1]
      pokemon.hp = array[2]
      end

      # binding.pry
  end

  def alter_hp(hp, db)

    what = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
  end
# binding.pry
end
