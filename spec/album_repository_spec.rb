require 'album_repository'

def reset_students_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

RSpec.describe AlbumRepository do
  before(:each) do 
    reset_students_table
  end

  describe '#all' do
    it 'returns array of all albums in database' do
      album_repository = AlbumRepository.new
      expect(album_repository.all.length).to eq 4
      expect(album_repository.all.first.id).to eq "1"
      expect(album_repository.all.first.title).to eq 'Donda'
      expect(album_repository.all.last.title).to eq 'Folklore'
    end
  end

  describe '#find' do
    it 'returns the album object with corresponding id' do
      album_repository = AlbumRepository.new
      expect(album_repository.find(1).title).to eq 'Donda'
    end

    it 'returns the album object with another id' do
      album_repository = AlbumRepository.new
      expect(album_repository.find(4).title).to eq 'Folklore'
    end
  end

  describe '#create' do
    it 'Adds album objects to database' do
      album = Album.new(5, 'Born Pink', 2022, 4)
      album_repository = AlbumRepository.new
      album_repository.create(album)
      expect(album_repository.all.last.title).to eq 'Born Pink'
    end

    it 'Adds multiple albums to database' do
      album = Album.new(5, 'Born Pink', 2022, 4)
      album_repository = AlbumRepository.new
      album_repository.create(album)
      expect(album_repository.all.last.title).to eq 'Born Pink'
      album2 = Album.new(6, 'The Forever Story', 2022, 5)
      album_repository.create(album2)
      expect(album_repository.all.last.title).to eq 'The Forever Story'
    end
  end

  describe '#delete' do
    it 'deletes an album from database' do
      album = Album.new(5, 'Born Pink', 2022, 4)
      album_repository = AlbumRepository.new
      album_repository.create(album)
      album_repository.delete(5)
      expect(album_repository.all.last.title).to eq 'Folklore'
    end

    it 'deletes multiple albums from database' do
      album_repository = AlbumRepository.new
      album_repository.delete(4)
      album_repository.delete(3)
      expect(album_repository.all.last.title).to eq 'Midnights'
    end
  end
end