class Pokemon
    attr_reader :db, :id
   attr_accessor :name, :type, :hp

  def initialize(arguments)
     arguments.each do |key, value|
       instance_variable_set("@#{key}",value)
     end
   end

   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type)
     VALUES (?, ?)", name, type)
   end

   def self.find(id, db)
     entry = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

     Pokemon.new(id: entry[0][0], name: entry[0][1], type: entry[0][2], hp: entry[0][3])
   end

   def alter_hp(hp, db)
     entry = db.execute("UPDATE pokemon SET hp = ? WHERE hp = 60", hp)
  end
 end
