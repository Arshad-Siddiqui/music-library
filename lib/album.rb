class album
  def initialize
    @id, @title, @release_year, @artist_id = [0, '', 0, 0]
  end

  attr_accessor :id, :title, :release_year, :artist_id
end

# id, title, release_year, artist_id