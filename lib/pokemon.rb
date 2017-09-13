class Pokemon
	attr_accessor :id, :name, :type, :hp, :db

	DATABASE_CONNECTION = SQLite3::Database.new('db/pokemon.db')

	def initialize(attributes)
		attributes.each {|attribute, value| self.send(("#{attribute}="), value)}
	end

	def self.save(name, type, db)
		sql = File.read("db/schema_migration.sql")
		db.execute_batch(sql)
		db.execute("
			INSERT INTO pokemon
			(name, type)
			VALUES (?,?)
			",
			name, type)
	end

	def self.find(id, db)
		sql = File.read("db/schema_migration.sql")
		db.execute_batch(sql)
		attributes = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
		Pokemon.new(id: attributes[0], name: attributes[1], type: attributes[2], hp: attributes[3])
	end

	def alter_hp(new_hp, db)
		db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id =#{id}")
	end

end
