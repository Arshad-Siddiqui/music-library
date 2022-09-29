require 'artists_repository'
require 'artist'

def reset_students_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

RSpec.describe ArtistRepository do
  before(:each) do 
    reset_students_table
  end

  describe '#all' do
    it 'returns complete array of artists objects from database' do
      repo = ArtistRepository.new
      expect(repo.all.first.name).to eq 'Kanye West'
    end
  end
end