require 'album'

class AlbumRepository
  def all
    sql = 'SELECT * FROM albums'
    result_set = DatabaseConnection.exec_params(sql,[])
    
    albums = []
    result_set.each do |result|
      album = Album.new
      album.id = result['id']
      album.title = result['title']
      album.release_year = result['release_year']
      album.artist_id = result['artist_id']
      albums.push album
    end
    albums
  end

  def find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    result = DatabaseConnection.exec_params(sql,[id])[0]
    album = Album.new
    album.id = result['id']
    album.title = result['title']
    album.release_year = result['release_year']
    album.artist_id = result['artist_id']
    album
  end

  def create(album)
    sql = "INSERT INTO albums (id, title, release_year, artist_id)
    VALUES($1, $2, $3, $4)"
    params = [album.id, album.title, album.release_year, album.artist_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = "DELETE FROM albums WHERE id = $1"
    DatabaseConnection.exec_params(sql, [id])
  end
end