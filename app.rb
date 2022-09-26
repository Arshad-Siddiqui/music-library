require_relative 'lib/database_connection'
require_relative 'lib/album'
require_relative 'lib/album_repository'

DatabaseConnection.connect('music_library')

# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
# end

new_album = Album.new

album_repository = AlbumRepository.new

new_album.id = 20
new_album.title = "Arshad fire mixtape"
new_album.release_year = 2022
new_album.artist_id = 6

album_repository.all.each do |album|
  p album
end