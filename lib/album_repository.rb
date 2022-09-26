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
    sql = "SELECT * FROM albums WHERE id = #{id}"
    result = DatabaseConnection.exec_params(sql,[])[0]
    album = Album.new
    album.id = result['id']
    album.title = result['title']
    album.release_year = result['release_year']
    album.artist_id = result['artist_id']
    album
  end

  def create(album)
    sql = "INSERT INTO albums (id, title, release_year, artist_id)
    VALUES(#{album.id}, '#{album.title}', #{album.release_year}, #{album.artist_id})"
    DatabaseConnection.exec_params(sql, [])
  end

  def delete(id)
    sql = "DELETE FROM albums WHERE id = #{id}"
    DatabaseConnection.exec_params(sql, [])
  end
end