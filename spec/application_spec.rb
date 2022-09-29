require_relative '../app.rb'

def reset_artists_albums_tables
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do
  before(:each) do 
    reset_artists_albums_tables
  end

  describe '#run' do
    context '1 is selected' do
      it 'returns a list of albums' do
        fake_io = double(:fake_io)
        expect(fake_io).to receive(:puts).with('What would you like to do?')
        expect(fake_io).to receive(:puts).with('1 - List all albums')
        expect(fake_io).to receive(:puts).with("2 - List all artists")
        expect(fake_io).to receive(:print).with('Enter your choice: ')
        expect(fake_io).to receive(:gets).and_return('1')
        expect(fake_io).to receive(:puts).with("Here is the list of albums")
        expect(fake_io).to receive(:puts).with('1 - Doolittle')
        expect(fake_io).to receive(:puts).with('2 - Surfer Rosa')
        expect(fake_io).to receive(:puts).with('3 - Waterloo')
        expect(fake_io).to receive(:puts).with('4 - Super Trouper')
        expect(fake_io).to receive(:puts).with('5 - Bossanova')
        expect(fake_io).to receive(:puts).with('6 - Lover')
        expect(fake_io).to receive(:puts).with('7 - Folklore')
        expect(fake_io).to receive(:puts).with('8 - I Put a Spell on You')
        expect(fake_io).to receive(:puts).with('9 - Baltimore')
        expect(fake_io).to receive(:puts).with('10 - Here Comes the Sun')
        expect(fake_io).to receive(:puts).with('11 - Fodder on My Wings')
        expect(fake_io).to receive(:puts).with('12 - Ring Ring')
        
        app = Application.new('music_library', fake_io, AlbumRepository.new, ArtistRepository.new)
        app.run
      end
    end

    context '2 is selected' do
      it 'returns a list of artists' do
        fake_io = double(:fake_io)
        expect(fake_io).to receive(:puts).with('What would you like to do?')
        expect(fake_io).to receive(:puts).with('1 - List all albums')
        expect(fake_io).to receive(:puts).with("2 - List all artists")
        expect(fake_io).to receive(:print).with('Enter your choice: ')
        expect(fake_io).to receive(:gets).and_return('2')
        expect(fake_io).to receive(:puts).with("Here is the list of artists")
        expect(fake_io).to receive(:puts).with("1 - Pixies")
        expect(fake_io).to receive(:puts).with("2 - ABBA")
        expect(fake_io).to receive(:puts).with("3 - Taylor Swift")
        expect(fake_io).to receive(:puts).with("4 - Nina Simone")

        app = Application.new('music_library', fake_io, AlbumRepository.new, ArtistRepository.new)
        app.run
      end
    end
  end
end