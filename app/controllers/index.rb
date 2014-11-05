get '/' do
  @photos = Photo.all.order('id DESC')
  erb :index
end