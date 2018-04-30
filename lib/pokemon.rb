require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
#  def initialize (attrs = {})
  #  attrs.each { |k,v| instance_variable_set(k,v) }
  # attrs.each { |name, value| instance_variable_set("@#{name}", value) }
  #   @id = attrs.fetch(:id)
  #   @name = attrs.fetch(:id)
  #   @type = attrs.fetch(:id)
  #   @db = attrs.fetch(:id)
  #   @hp = attrs.fetch(:id, 60)
  # end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    db.results_as_hash = true
    results = db.execute("SELECT * FROM pokemon WHERE id=?",id)
  #  binding.pry
    Pokemon.new(id: results[0]["id"], name: results[0]["name"], type: results[0]["type"], db: db)
#      hp: results[0].has_key?("hp") ? results[0]['hp'] : nil)
  end
end
