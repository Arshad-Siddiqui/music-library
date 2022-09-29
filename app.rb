require_relative './lib/artists_repository.rb'
require_relative './lib/album_repository.rb'
require_relative './lib/database_connection.rb'


class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts 'What would you like to do?'
    @io.puts '1 - List all albums'
    @io.puts "2 - List all artists"
    @io.print 'Enter your choice: '
    answer = @io.gets.chomp
    
    case answer
      when "1"
        @io.puts "Here is the list of albums"
        @album_repository.all.each do |album|
          @io.puts "#{album.id} - #{album.title}"
        end
      when "2"
        @io.puts "Here is the list of artists"
        @artist_repository.all.each do |artist|
          @io.puts "#{artist.id} - #{artist.name}"
        end
    end
  end
end


if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end