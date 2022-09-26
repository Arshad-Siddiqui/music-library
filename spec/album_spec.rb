require 'album'

RSpec.describe Album do
  describe '#initialize' do
    it 'constructs' do
      album = Album.new(1, 'The Forever Story', 2022, 1)
      expect(album.view).to eq '1, The Forever Story, 2022, 1'
    end
  end
end