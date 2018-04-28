require "pry"

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(attributes)
    attributes.each do |k,v|
          instance_variable_set("@#{k}",v) unless v.nil?
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = #{id}").first
    Pokemon.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = 59 WHERE id = 1")
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")

  end
end
