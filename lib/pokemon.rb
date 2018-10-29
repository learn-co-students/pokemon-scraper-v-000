class Pokemon

  attr_accessor :name, :id, :type, :db


  def initialize(id, name, type, db)
    @id = :id
    @name = :name
    @type = :type
    @db = :db
  end

  def self.save
  end

  def self.find
  end


end
