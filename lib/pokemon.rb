class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name: name, type: name, db: name, id: name, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  # https://stackoverflow.com/questions/9614236/escaping-strings-for-ruby-sqlite-insert
  # Escape single quotes, remove newline, split on tabs,
  # wrap each item in quotes, and join with commas
  def prepare_for_insert(s)
    s.gsub(/'/,"\\\\'").chomp.split(/\t/).map {|str| "'#{str}'"}.join(", ")
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    p = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: p[0], name: p[1], type: p[2], hp: p[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end

end
