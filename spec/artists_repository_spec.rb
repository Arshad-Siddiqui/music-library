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
      expect(repo.all.last.genre).to eq 'Rock'
    end
  end

  describe '#find' do
    it 'returns single artist object from database' do
      repo = ArtistRepository.new
      expect(repo.find(1).name).to eq 'Kanye West'
      expect(repo.find(3).name).to eq 'Dua Lipa'
      expect(repo.find(2).id).to eq "2"
    end
  end

  describe '#create' do
    it 'Adds an entry to artists table' do
      artist = Artist.new(6, 'Kendrick Lamar', 'Rap')
      repo = ArtistRepository.new
      repo.create(artist)
      expect(repo.find(6).name).to eq 'Kendrick Lamar'
      artist2 = Artist.new(7, 'Drake', 'Rap')
      repo.create(artist2)
      expect(repo.find(7).name).to eq 'Drake'
    end
  end

  describe '#delete' do
    it 'removes an instance from the artists table' do
      repo = ArtistRepository.new
      repo.delete(1)
      expect(repo.all.first.name).to eq 'Taylor Swift'
      repo.delete(2)
      expect(repo.all.first.name).to eq 'Dua Lipa'
    end
  end

  describe '#update' do
    it 'updates a field on the artists table' do
      repo = ArtistRepository.new
      repo.update('name', 'Jay Z', 1)
      expect(repo.find(1).name).to eq 'Jay Z'
    end
  end
end