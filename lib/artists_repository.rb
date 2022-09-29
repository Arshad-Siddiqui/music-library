class ArtistRepository
  def all
    artists = []
    DatabaseConnection.exec_params('SELECT * FROM artists',[]).each do |result|
      p result
      artist = Artist.new(result['id'], 'Kanye West', result['genre'])
      p artist
      artist.name = result['name']
      artists << artist
    end
    return artists
  end

  def find(id)
    result = DatabaseConnection.exec_params('SELECT * FROM artists WHERE id = $1', [id])
    artist = Artist.new(result['id'], result['name'], result['genre'])
  end

  def create(artist)
    DatabaseConnection.exec_params('INSERT INTO artists (id, name, genre) 
    VALUES($1, $2, $3)', [artist.id, artist.name, artist.genre])
  end

  def delete(id)
    DatabaseConnection.exec_params('DELETE FROM artists WHERE id = $1', [id])
  end

  def update(column, value, id)
    sql = "UPDATE artists SET #{column} = #{value} WHERE id = #{id}"
  end
end