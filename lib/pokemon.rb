require 'pry'

class Pokemon

  def initialize(name:, type:, db:)

    @name = name
    @type = type
    @db = db

    binding.pry
  end

  def self.save(id, name, type)
    @db.excute("INSERT INTO pokemon (id, name, type) VALUE (?, ?, ?)", id, name, type)
  end


end
