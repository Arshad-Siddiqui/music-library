class ArtistRepository
  def all
    DatabaseConnection.exec_params('SELECT * FROM artists').map do |result|
      artist = Artist.new(result['id'], result['name'], result['genre'])
    end
  end

  def find(id)
    result = DatabaseConnection.exec_params('SELECT * FROM artists WHERE id = $1', [id])[0]
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
    DatabaseConnection.exec_params("UPDATE artists SET #{column} = $1 WHERE id = $2", [value, id])
  end
end