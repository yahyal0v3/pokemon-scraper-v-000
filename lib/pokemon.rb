require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id: , name: , type: , hp: , db: )
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    pokemon = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @@all << pokemon
  end

  def self.find(id, db)
    binding.pry
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], hp: pokemon_array[3], db: db)
  end


end
