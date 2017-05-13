class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

	def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
		@name = name
		@type = type
    @hp = hp
    @db = db
	end

  def self.save(pman_name, pman_type, pman_db)
    pman_db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pman_name, pman_type)
  end

  def self.find(pman_id, pman_db)
    result = pman_db.execute("SELECT * FROM pokemon WHERE id = ?",pman_id)
    self.new(id: pman_id, name: result[0][1], type: result[0][2], hp: result[0][3], db: pman_db)
  end

  def alter_hp(new_hp, pman_db)
    pman_db.execute("UPDATE pokemon SET hp = ? WHERE name = ?",new_hp,self.name)
  end

end
