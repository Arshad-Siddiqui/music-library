class Album
  def initialize
    @id, @title, @release_year, @artist_id = [0, '', 0, 0]
  end

  attr_accessor :id, :title, :release_year, :artist_id

  def view
    "#{@id}, #{@title}, #{@release_year}, #{@artist_id}"
  end
end

# id, title, release_year, artist_id