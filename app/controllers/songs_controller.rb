get '/songs' do
  @songs = Song.all
end
