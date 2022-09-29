 class Artist
  def initialize(id = 0, name = '', genre = '')
    @id, @name, @genre = id, name, genre
  end

  attr_accessor :id, :name, :genre
 end