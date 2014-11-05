get '/' do
  @photos = Photo.all
  erb :index
end

# get '/test' do
#   # @photo = Photo.all
#   erb :test
# end
