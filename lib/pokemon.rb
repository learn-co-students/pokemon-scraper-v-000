class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(attrs, hp=nil)
    @id = attrs[:id]
    @name = attrs[:name]
    @type = attrs[:type]
    @hp = hp
  end

  def self.save(name, type, db)
    input = db.prepare('INSERT into pokemon(name, type) VALUES(?, ?)')
    input.execute(name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = '#{id}'")[0]
    begin
      hp = db.execute("SELECT hp FROM pokemon WHERE id = '#{id}'").flatten[0]
    rescue
      hp = 60
    end
    self.new({:id => pokemon[0], :name => pokemon[1], :type => pokemon[2]}, hp)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = '#{self.id}'")
  end

end
