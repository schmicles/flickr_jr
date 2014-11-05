get '/' do
  @photos = Photo.all.order('id DESC')
  erb :index
end

# get '/test' do
#   # @photo = Photo.all
#   erb :test
# end
